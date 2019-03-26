library(MoLE)


### Name: SUCCESS
### Title: Determine communicative success
### Aliases: SUCCESS
### Keywords: misc

### ** Examples

FOUND()
situation=SITUATION(1)
(proposition=PROPOSITION(1, situation))
utterance=PRODUCE(1, proposition)
(interpretation=INTERPRET(2, utterance, situation))
SUCCESS(proposition, interpretation, situation)



