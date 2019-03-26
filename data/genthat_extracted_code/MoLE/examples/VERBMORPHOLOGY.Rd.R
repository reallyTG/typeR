library(MoLE)


### Name: VERBMORPHOLOGY
### Title: Interpret verbal morphology
### Aliases: VERBMORPHOLOGY
### Keywords: misc

### ** Examples

FOUND()
situation=SITUATION(1)
proposition=PROPOSITION(1, situation)
proposition$verb$topic=0; if('internal'%in%names(proposition)){proposition$internal$topic=0}
proposition$external$topic=1; proposition$external$recency=10
proposition=TOPICFIRST(1, proposition)
utterance=PRODUCE(1, proposition)
analysis=ANALYZE(2, utterance, situation)
grouping=GROUP(2, analysis)
for(i in 1:length(grouping)){
	if('verbAdposition'%in%grouping[[i]]$role){
		print(VERBMORPHOLOGY(2, grouping[[i]]))	
}	}



