library(IPPP)


### Name: IPPPinterval
### Title: Simulate the Number of Events in an Interval
### Aliases: IPPPinterval
### Keywords: Poisson IPPP

### ** Examples

#determine rate function
sx=1:5
sy=c(0,1,1,3,0)
sm=c(1,0,1,0,-1)
xrate=seq(1,5,length.out=100)
yrate=splinefunH(sx,sy,sm)(xrate)
#plot rate function
plot(xrate,yrate,type='l',xlim=c(0.5,5.5), main='Rate Function') 
#determine no of events between 3 and 6
from=3
to=5
lines(c(from,from),c(0,10)) #mark interval in the plot
lines(c(to,to),c(0,10))
#simulate the number of events in the interval [from, to]
IPPPinterval(from,to,xrate,yrate) #simulate the number of events in the interval [from, to]
#rescale so that the whole rate function will on average generate 200 events:
IPPPinterval(from,to,xrate,yrate,expsamplesize=200)
#now more events occur in the interval [from, to]!
#Make 20 repetitions of the upper simulation
IPPPinterval(from,to,xrate,yrate,no=20,expsamplesize=200)



