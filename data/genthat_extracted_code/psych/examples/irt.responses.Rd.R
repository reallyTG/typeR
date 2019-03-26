library(psych)


### Name: irt.responses
### Title: Plot probability of multiple choice responses as a function of a
###   latent trait
### Aliases: irt.responses
### Keywords: multivariate models

### ** Examples

data(iqitems)
iq.keys <- c(4,4,4, 6,6,3,4,4,  5,2,2,4,  3,2,6,7)
scores <- score.multiple.choice(iq.keys,iqitems,score=TRUE,short=FALSE)
#note that for speed we can just do this on simple item counts rather
# than IRT based scores.
op <- par(mfrow=c(2,2))  #set this to see the output for multiple items
irt.responses(scores$scores,iqitems[1:4],breaks=11)
op <-  par(op)



