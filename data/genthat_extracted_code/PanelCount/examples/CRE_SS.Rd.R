library(PanelCount)


### Name: CRE_SS
### Title: A Sample Selection Model with Correlated Random Effects
### Aliases: CRE_SS

### ** Examples

## No test: 
data(rt)
# Note: estimation may take up 10~15 minutes
est = CRE_SS(isRetweet~fans+tweets+as.factor(tweet.id),
                       num.words~fans+tweets+as.factor(tweet.id),
                       id=rt$user.id, data=rt)
## End(No test)



