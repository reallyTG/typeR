library(mosaic)


### Name: rand
### Title: Random Regressors
### Aliases: rand
### Keywords: distribution regression

### ** Examples

rand(2,nrow=4)
rand(2,rdist=rpois, args=list(lambda=3), nrow=4)
summary(lm( waiting ~ eruptions + rand(1), faithful))



