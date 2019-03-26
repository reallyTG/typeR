library(PanelCount)


### Name: PLN_RE
### Title: A Poisson Lognormal Model with Random Effects
### Aliases: PLN_RE

### ** Examples

## No test: 
data(rt)
est = PLN_RE(num.words~fans+tweets+as.factor(tweet.id),
              id=rt$user.id[rt$isRetweet==1],
              data=rt[rt$isRetweet==1,])
## End(No test)



