library(MoLE)


### Name: PROTOINTERPRETATION
### Title: Develop interpretation
### Aliases: PROTOINTERPRETATION
### Keywords: misc

### ** Examples

FOUND()
situation=SITUATION(1)
proposition=PROPOSITION(1, situation)
utterance=PRODUCE(1, proposition)
(analysis=ANALYZE(2, utterance, situation))
PROTOINTERPRETATION(2, analysis)



