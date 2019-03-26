library(MoLE)


### Name: FREQUPDATE
### Title: Update usage numbers
### Aliases: FREQUPDATE
### Keywords: misc

### ** Examples

FOUND()
situation=SITUATION(1)
proposition=PROPOSITION(1, situation)
population[[1]]$nouns[population[[1]]$nouns$ID%in%c(proposition$external$ID),]
population[[1]]$wordOrder
FREQUPDATE(1, proposition, success=1)
population[[1]]$nouns[population[[1]]$nouns$ID%in%c(proposition$external$ID),]
population[[1]]$wordOrder



