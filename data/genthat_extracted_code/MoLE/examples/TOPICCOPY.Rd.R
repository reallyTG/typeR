library(MoLE)


### Name: TOPICCOPY
### Title: Make anaphoric copy of topic
### Aliases: TOPICCOPY
### Keywords: misc

### ** Examples

FOUND()
situation=SITUATION(1)
proposition=PROPOSITION(1, situation)
proposition$verb$topic=0; if('internal'%in%names(proposition)){proposition$internal$topic=0}
proposition$external$topic=1; proposition$external$recency=10
world$topicCopy=FALSE
proposition=TOPICFIRST(1, proposition)
PRODUCE(1, proposition)
proposition=TOPICCOPY(1, proposition)
PRODUCE(1, proposition)



