library(MoLE)


### Name: INTERPRET.INT
### Title: Develop an interpretation
### Aliases: INTERPRET.INT
### Keywords: misc

### ** Examples

FOUND()
situation=SITUATION(1)
proposition=PROPOSITION(1, situation)
utterance=PRODUCE(1, proposition)
analysis=ANALYZE(2, utterance, situation)
(analysis=PROTOINTERPRETATION(2, analysis))
INTERPRET.INT(2, analysis, situation)



