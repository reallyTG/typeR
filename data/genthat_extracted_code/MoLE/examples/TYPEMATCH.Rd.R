library(MoLE)


### Name: TYPEMATCH
### Title: Determine role qualification
### Aliases: TYPEMATCH
### Keywords: misc

### ** Examples

FOUND()
situation=SITUATION(1)
proposition=PROPOSITION(1, situation)
utterance=PRODUCE(1, proposition)
analysis=ANALYZE(2, utterance, situation)
TYPEMATCH(2, analysis)



