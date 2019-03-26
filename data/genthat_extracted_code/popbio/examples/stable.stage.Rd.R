library(popbio)


### Name: stable.stage
### Title: Stable stage distribution
### Aliases: stable.stage
### Keywords: survey

### ** Examples


data(teasel)
w<-stable.stage(teasel)
w
barplot( w,  col="green", ylim=c(0,1), las=1,
       ylab="Stable stage proportion", xlab="Stage class", main="Teasel")
box()




