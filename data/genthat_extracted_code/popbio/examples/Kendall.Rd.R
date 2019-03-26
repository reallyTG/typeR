library(popbio)


### Name: Kendall
### Title: Find the best Kendall's estimates of mean and environmental
###   variance for beta-binomial vital rates.
### Aliases: Kendall
### Keywords: survey

### ** Examples

## desert tortoise input from Box 8.2 - compare results to Table 8.3
tor<-data.frame(rate=rep(c("g4","g5","g6"),each=3),
year=rep(1:3,3),      ## representing 70s, early 80s, late 80s
start=c(17,15,7,22,19,4,32,31,10),
grow=c(8,1,0,5,5,0,2,1,0))
## use fewer grades for faster loop
tor.est<-Kendall(tor, grades=200)
tor.est

data(woodpecker) 
wp.est <- Kendall(woodpecker, grades=200)
wp.est



