library(mlogitBMA)


### Name: mnl.spec
### Title: Specification Object of a Multinomial Logit Model
### Aliases: mnl.spec
### Keywords: classes models

### ** Examples

data(heating)
spec <- mnl.spec(depvar ~ ic + oc + income, heating, varying=3:12, sep='')
summary(spec)
spec <- mnl.spec(depvar ~ oc-1 | ic, heating, varying=3:12, sep='')
summary(spec)



