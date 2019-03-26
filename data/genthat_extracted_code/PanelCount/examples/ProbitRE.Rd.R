library(PanelCount)


### Name: ProbitRE
### Title: A Probit Model with Random Effects
### Aliases: ProbitRE

### ** Examples

## No test: 
data(rt)
est = ProbitRE(isRetweet~fans+tweets+as.factor(tweet.id),
                    id=rt$user.id, data=rt)
## End(No test)



