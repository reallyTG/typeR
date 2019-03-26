library(psych)


### Name: score.multiple.choice
### Title: Score multiple choice items and provide basic test statistics
### Aliases: score.multiple.choice
### Keywords: multivariate models

### ** Examples

data(iqitems)
iq.keys <- c(4,4,4, 6,6,3,4,4,  5,2,2,4,  3,2,6,7)
score.multiple.choice(iq.keys,iqitems)
#just convert the items to true or false 
iq.tf <- score.multiple.choice(iq.keys,iqitems,score=FALSE)
describe(iq.tf)  #compare to previous results




