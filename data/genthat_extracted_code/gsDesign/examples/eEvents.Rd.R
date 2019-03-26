library(gsDesign)


### Name: eEvents
### Title: Expected number of events for a time-to-event study
### Aliases: eEvents print.eEvents 'Expected number of events for survival
###   studies'
### Keywords: design

### ** Examples

# 3 enrollment periods, 3 piecewise exponential failure rates
eEvents(lambda=c(.05,.02,.01), eta=.01, gamma=c(5,10,20), 
             R=c(2,1,2), S=c(1,1), T=20)
             
# control group for example from Berstein and Lagakos (1978) 
lamC<-c(1,.8,.5)
n<-eEvents(lambda=matrix(c(lamC,lamC*2/3),ncol=6), eta=0, 
           gamma=matrix(.5,ncol=6), R=2, T=4)



