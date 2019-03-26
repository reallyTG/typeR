library(QuantPsyc)


### Name: Normalize
### Title: Normalize Data
### Aliases: Normalize
### Keywords: univar distribution

### ** Examples


summary(USJudgeRatings$CONT)
plot(density(USJudgeRatings$CONT))

ContN <- Normalize(USJudgeRatings$CONT)
summary(ContN)
lines(density(ContN), col=2)



