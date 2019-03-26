library(MoLE)


### Name: WORDORDER
### Title: Use word order for interpretation
### Aliases: WORDORDER
### Keywords: misc

### ** Examples

FOUND()
situation=SITUATION(1)
proposition=PROPOSITION(1, situation)
utterance=PRODUCE(1, proposition)
analysis=ANALYZE(2, utterance, situation)
WORDORDER(2, analysis)
population[[2]]$wordOrder[2,]$success=999	#makes AUV standard
population[[2]]$wordOrder
WORDORDER(2, analysis)



