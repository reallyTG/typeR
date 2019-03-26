library(MoLE)


### Name: EROSION
### Title: Word erosion
### Aliases: EROSION
### Keywords: misc

### ** Examples

FOUND()
situation=SITUATION(1)
proposition=PROPOSITION(1, situation)
utterance=PRODUCE(1, proposition)
interpretation=INTERPRET(2, utterance, situation)
EROSION(2, interpretation)



