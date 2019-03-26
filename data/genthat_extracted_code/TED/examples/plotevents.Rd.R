library(TED)


### Name: plotevents
### Title: Plot the detected events
### Aliases: plotevents

### ** Examples

##################################
#   1st art eg (white noise)
##################################
set.seed(123)
n=128
types=c('box','rc','cr','sine')
shapes=matrix(NA,20,n)
for (i in 1:20){
  shapes[i,]=cbfs(type=types[sample(1:4,1)])
}
whitenoise=ts2mat(rnorm(128*20),128)
# generate x which randomly combine the four types of events with each two of them
# separated by noise
x=c(rnorm(128),t(cbind(shapes,whitenoise)))
plot(x,ty='l')
w=128; alpha=0.05
# event detection
## Not run: 
##D events=eventDetection(x,w,'white',FALSE,alpha,'art')
##D clustering events
##D cc=eventCluster(events,4)
##D myclkm=cc$cl
##D # plot the clustered events
##D plotevents(events,cluster=TRUE, myclkm)
## End(Not run)
##################################
#   2nd art eg (red noise)
##################################
set.seed(123)
# generate a time series with red noise; this is the same with the one used
# in Kang et al. (2014)
coeff=0.5;s=1
x=c(arima.sim(list(order = c(1,0,0),ar=coeff),n=500,sd=s),
    cbfs_red('rc'),arima.sim(list(order = c(1,0,0),ar=coeff),n=400,sd=s),
    cbfs_red('cr'),arima.sim(list(order = c(1,0,0),ar=coeff),n=400,sd=s),
    cbfs_red('box'),arima.sim(list(order = c(1,0,0),ar=coeff),n=400,sd=s),
    cbfs_red('sine'),arima.sim(list(order = c(1,0,0),ar=coeff),n=1000,sd=s),
    arima.sim(list(order = c(1,0,0),ar=0.8),n=1100,sd=4))
w=128; alpha=0.05
# event detection
## Not run: 
##D events=eventDetection(x,w,'red',parallel=FALSE,alpha,'art')
##D # plot events without clustering
##D plotevents(events)
## End(Not run)



