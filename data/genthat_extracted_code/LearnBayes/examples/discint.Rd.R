library(LearnBayes)


### Name: discint
### Title: Highest probability interval for a discrete distribution
### Aliases: discint
### Keywords: models

### ** Examples

x=0:10
probs=dbinom(x,size=10,prob=.3)
dist=cbind(x,probs)
pcontent=.8
discint(dist,pcontent)



