library(MoLE)


### Name: ANALYZE
### Title: Determine sentence constituents
### Aliases: ANALYZE
### Keywords: misc

### ** Examples

FOUND()
situation=SITUATION(1)
proposition=PROPOSITION(1, situation)
(utterance=PRODUCE(1, proposition))
ANALYZE(2, utterance, situation)



