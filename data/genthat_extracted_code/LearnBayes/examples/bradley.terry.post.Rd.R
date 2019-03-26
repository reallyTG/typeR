library(LearnBayes)


### Name: bradley.terry.post
### Title: Log posterior of a Bradley Terry random effects model
### Aliases: bradley.terry.post
### Keywords: models

### ** Examples

data(baseball.1964)
team.strengths=rep(0,10)
log.sigma=0
bradley.terry.post(c(team.strengths,log.sigma),baseball.1964)



