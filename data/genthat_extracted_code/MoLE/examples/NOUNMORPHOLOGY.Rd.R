library(MoLE)


### Name: NOUNMORPHOLOGY
### Title: Interpret nominal morphology
### Aliases: NOUNMORPHOLOGY
### Keywords: misc

### ** Examples

FOUND()
situation=SITUATION(1)
proposition=PROPOSITION(1, situation)
prep=PREPARE(1, proposition, situation)
utterance=PRODUCE(1, prep)
analysis=ANALYZE(2, utterance, situation)
grouping=GROUP(2, analysis)
(analysis=NOUNMORPHOLOGY(2, grouping[[length(grouping)]]))
analysis$role
#repeat if no nounAdposition is identified.



