library(Rfit)


### Name: allscores
### Title: All Scores
### Aliases: wscores nscores bentscores1 bentscores2 bentscores3
###   bentscores4 logGFscores logrank.scores
### Keywords: datasets

### ** Examples

data(wscores)
x<-runif(10)
y<-rlogis(10)
rfit(y~x,scores=wscores)



