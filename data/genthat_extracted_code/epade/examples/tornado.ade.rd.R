library(epade)


### Name: tornado.ade
### Title: Tornado or population plot
### Aliases: tornado.ade
### Keywords: tornado

### ** Examples

tab1<-cbind(rpois(20, 20),rpois(20, 20))
tab2<-cbind(rpois(20, 15),rpois(20, 15))
tab3<-cbind(rpois(20, 10),rpois(20, 10))
tornado.ade(list(tab1, tab2, tab3), gnames=c('Men','Women'), xlab='number')



