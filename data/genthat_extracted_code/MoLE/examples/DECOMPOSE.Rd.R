library(MoLE)


### Name: DECOMPOSE
### Title: Decompose words into morphemes
### Aliases: DECOMPOSE
### Keywords: misc

### ** Examples

FOUND()
old=world$suffixThreshold
situation=SITUATION(1)
proposition=PROPOSITION(1, situation)
(utterance=PRODUCE(1, proposition))
(utterance=gsub(' ', '', utterance))
world$suffixThreshold=20
DECOMPOSE(2, utterance)
world$suffixThreshold=old



