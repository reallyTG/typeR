library(PanelCount)


### Name: PoissonRE
### Title: A Poisson Model with Random Effects
### Aliases: PoissonRE

### ** Examples

## No test: 
data(rt)
est = PoissonRE(num.words~fans+tweets+as.factor(tweet.id),
                     id=rt$user.id[rt$isRetweet==1],
                     data=rt[rt$isRetweet==1,])
## End(No test)



