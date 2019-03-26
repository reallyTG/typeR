library(verification)


### Name: brier
### Title: Brier Score
### Aliases: brier
### Keywords: file

### ** Examples


#  probabilistic/ binary example

pred<- runif(100)
obs<- round(runif(100))
brier(obs, pred)




