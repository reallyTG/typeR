library(LearnBayes)


### Name: normnormexch
### Title: Log posterior of mean and log standard deviation for
###   Normal/Normal exchangeable model
### Aliases: normnormexch
### Keywords: models

### ** Examples

s.var <- c(0.05, 0.05, 0.05, 0.05, 0.05)
y.means <- c(1, 4, 3, 6,10)
data=cbind(y.means, s.var)
theta=c(-1, 0)
normnormexch(theta,data)



