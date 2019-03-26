library(phylosim)


### Name: GeneralInsertor
### Title: The GeneralInsertor class
### Aliases: GeneralInsertor

### ** Examples

	# create a GeneralInsertor object
	i<-GeneralInsertor(
		name="GIN",
		rate=1,
		propose.by=function(process){4}, # fixed insert length
		acceptBy=function(process,sequence,window){TRUE},# always accept insertions
		template.seq=NucleotideSequence(string="A"),# a boring template sequence
		insert.hook=function(seq){ return(seq)},# a boring insert hook
		accept.win=2 #4 sites affecting acceptance
	)
	i
	# check if object inherits from GeneralInsertor
	is.GeneralInsertor(i)
	# get object summary
	summary(i)
	# set/get general rate
	i$rate<-0.5
	i$rate
	# set/get name
	i$name<-"Ins"
	i$name
	# set/get proposeBy
	# sample insertion length between 1 and 10
	i$proposeBy<-function(process){sample(1:10,1)}
	i$proposeBy
	# set/get acceptBy
	# reject half of the insertions
	i$acceptBy<-function(process, sequence, window){ sample(c(TRUE,FALSE), 1) }
	i$acceptBy
	# get generateBy
	i$generateBy
	# set/get acceptWin
	i$acceptWin<-1;
	# set/get insert hook
	i$insertHook<-function(
                           seq,
                           target.seq,
                           event.pos,
                           insert.pos
                           ){ attachProcess(seq, GTR() );seq}
	i$insertHook
	# set/get template sequence
	i$templateSeq<-NucleotideSequence(
                                       length=5,
                                       processes=list(list(JC69()))
                                   ) # length: 5, states: NA
	i$templateSeq
	# generate an insert sequence
	generateInsert(i)
	# create a sequence object and attach the process i
	s<-NucleotideSequence(string="AAAAA",processes=list(list(i)))
       # set rate multiplier
       setRateMultipliers(s,i,2)
       # get the list of active events from site 2
       events<-getEventsAtSite(i,s$sites[[2]])
       events
       # set postition for event
       e<-events[[1]]
       e$.position<-2
       # print sequence
       s
       # perform event
       Perform(e)
       # check sequence again
       s
 


