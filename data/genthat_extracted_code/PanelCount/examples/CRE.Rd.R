library(PanelCount)


### Name: CRE
### Title: A Model with Correlated Random Effects in Poisson and Probit
###   Equations
### Aliases: CRE

### ** Examples

## No test: 
data(rt)
# Note: estimation may take 2~3 minutes
est = CRE(isRetweet~fans+tweets+as.factor(tweet.id),
                   num.words~fans+tweets+as.factor(tweet.id),
                   id=rt$user.id, data=rt)
## End(No test)



