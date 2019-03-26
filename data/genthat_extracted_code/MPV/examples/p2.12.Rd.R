library(MPV)


### Name: p2.12
### Title: Data Set for Problem 2-12
### Aliases: p2.12
### Keywords: datasets

### ** Examples

data(p2.12)
attach(p2.12)
usage.lm <- lm(usage ~ temp)
summary(usage.lm)
predict(usage.lm, newdata=data.frame(temp=58), interval="prediction")
detach(p2.12)



