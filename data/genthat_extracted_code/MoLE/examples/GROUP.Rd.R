library(MoLE)


### Name: GROUP
### Title: Group words into constituents
### Aliases: GROUP
### Keywords: misc

### ** Examples

FOUND()
situation=SITUATION(1)
proposition=PROPOSITION(1, situation)
utterance=PRODUCE(1, proposition)
utterance=paste(utterance, unlist(strsplit(utterance, ' '))[1])
analysis=ANALYZE(2, utterance, situation)
GROUP(2, analysis)



