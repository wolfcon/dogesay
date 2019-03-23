preexec() { eval "$PROMPT_COMMAND" }

## words that doge say
declare -a WOWARR=("WOW" "MUCH" "VERY" "INTERESTING" "NICE" "TRULY" "GOOD" "EXCELLENT" "EASY" "INDEED" "HIGHLY" "PRETTY" "QUITE" "SUCH" "MANY" "SO")
WOWARRLEN=${#WOWARR[@]}

## A list of element that doge should not say a word about
declare -a NODOGE=("CMAKE" "MAKE" "CLEAR" "WOW" "EXIT" "./")

## doge check what he should not say
containsElement () {
	for i in "${NODOGE[@]}"
	do
		if [[ $1 =~ $i ]]
		then
			return 0
		fi
	done
	return 1
}

DOGE='                                                                 ````                         
                                                               `/yMMy                         
                   `oooooo`                                   :sMmyMy                         
                  odMdyydMdo                                  yN+++ms                         
                `-dNso+++omNN/.                            .+Nmd:/+hdN.                       
                /Nmdo++oo++sddh///                       ./mNh+:://+yM.                       
                /Myo+ooooo++++oymN                      sdMyo::::::+yNy+                      
                /My+ooooooooo+++ymh+`   `````````:hhhhhhNh+::::::::++oNd`                     
               -oMs+ooooooooooo+++syd:--hNddddddddmo/////::::::::::///hdN:                    
               dNds++oshhhssooooooooohhyhy::::::::::::::::::::::::::::/oMs/                   
               mdo+++osMMMmhosooooooo//:::::::::::::::::::::::::::::::::omMy:                 
               md+++ossMMMMmssssoooo+::::::::::::::::::::::::::::::::::::///shhdm:.           
               md+++ossmNMMMNhysoo+/::::::::::::::::::::::::::::::::::::::::://odhy:::        
               md+++oossydMMMMms+/::::::::::::::::::::::::::::::::::::::::::::::::/ymN        
               md+++ooosssNNNhs/::::::::::::::::::::::::::::::::::::::::::/:::::::::hN`       
               md+++ooossoo+/::::::::::::::::::::::::::::::::::::::::::/+symy///:::://m+      
               md+++oooo+/::::::::::::::::::::::::::::::::::::::::::::oos++MMNNh::::::do/     
               md+++o++::::::::::::::::::::::::/syy+::::::::::::::::::dmomMMMMMh/::::::yM`    
             ``md+++/::::::::::::::::::::::::/sdmNMmddo:::::::::::::::++odmNNNo+/::::::/+h+   
             +mmh+++:::::::::::::::::::::::/+mmd+sMMMMNm+/:::::::::::::::/++++/::::::::::Ny   
             oMhhyso::::::::---------::::::yNMs`dNMMMMMMhs/:::::::::::::::::::::::::-----hs/` 
             oMMms/:::::::-............--::+ssssNMMMMMMM///::::::::::::::::::::::---......oM- 
            .sMo/::::::--...````````````.----:/++++ooooo//::::::::::::---:////:::.````````+M: 
            mmd/:::::::...````````````````...-------:::::::::::::::---://ydmmNNmm/:```````/d/-
            My:::::::::..````````````````````........--------------...dNMMMMMMMMMMd`````````dd
          +yNy:::::::--..`````````````````````````````````````````````mMMMMMMMMMMMd`````````dd
          yM+/:::::::-...`````````````````````````````````````````````hmmNMMMMMMMMd`````````dd
        `:hM:::::::::--..`````````````````````````````````````````````...sddmMMNddy`````````dd
        .Mdy:::::::::::..```````````````````````````````````````````````````:ss/````````````dd
        .Mo::::::::::::...``````````````````````````````````````````````````........````````dd
       .:Mo::::::::::::--.``````````````````````````````````````````````----ommmmmmm:```````dd
       hNh+:::::::::::::-...`````````````````````````````-///////:..-//+mmmmmNNmdddh:```````dd
       dm:::::::::::::::::-..````````````````````````````:ooyMMNNdyyhmyysssoooo/---.````````dh
      `dm:::::::::::::::::---.``````````````````````````````./////////-....``````````````./h+-
     :mmd::::::::::::::::::::-.``````````````````````````````````````````````````````````dmm- 
    /sM+:::::::::::::::::::::::-.``````````````````````````````````````````````````````:+Ny   
    Nms/::::::::::::::::::::::::--.```````````````````````````````````````````````````.sMo:   
    Nd::::::::::::::::::::::::::::..`````````````````````````````````````````````````.dNM`    
    Nd:::::::::::::::::::::::::::::--```````````````````````````````````````````````-/MMM`    
    Nd:::::::::::::::::::::::::::::::..```````````````````````````````````````````.omMsdMo:   
    Nd:::::::::::::::::::::::::::::::..``.yyyy+..````````````````````````````....shMs/`-/Ny   
    Nd:::::::::::::::::::::::::::::-...```:::mmhdy...````````````````````...oddhhmd:.````Ny   
    Nd::::::::::::::::::::--------...```````````sddNN//////////:``````://dMddd:-.````````Ny   
    Nd:::::::::::::::-----..........```````````````/syyyyyyyyymNssssssNNyyy:::--.````````ooo. 
    Nd::::::::::::-.-..........`````````````````````.:::::::::+oooooooo+:::..-..``````````+M: 
    Nh------::::-...`````````````````````````````````....--::::::::::::::....`````````````/NNh
    dy...........`````````````````````````````````````````...--:::::-----..`````````````````dd
    Nh```````````````````````````````````````````````````````..-----....````````````````````d 
'

## the doge magic
PROMPT_COMMAND='HIS="$(tail -n 1 $HOME/.zsh_history)";
				HISL="$(cut -d";" -f2 <<<$HIS|tr a-z A-Z)";
				HISLEN=${#HISL};
				if containsElement $HISL
				then
				else
					WOWEMPTYLINE="";
					WOWEMPTYLINECOUNT=$(( ( RANDOM % $(( 48 - 7*($HISLEN/10+1) )) )+1));
					for i in {1..$WOWEMPTYLINECOUNT}
					do
						WOWEMPTYLINE="$WOWEMPTYLINE\n"
					done;
					WOWGAP=" ";
					for i in {1..$((  RANDOM % 30 ))}
					do
						WOWGAP="$WOWGAP "
					done;
					WOWGAPEACHLINE=""
					for i in {1..48}
					do
						WOWGAPEACHLINE="$WOWGAPEACHLINE$WOWGAP\n"
					done;
					WOWPREIND=$(( ( RANDOM % $WOWARRLEN )  + 1 ));
					paste <(echo $DOGE) <(echo $WOWGAPEACHLINE) <(echo $WOWEMPTYLINE; echo "$WOWARR[$WOWPREIND] $HISL"|figlet)| column -s $'\t' -t|lolcat
				fi'