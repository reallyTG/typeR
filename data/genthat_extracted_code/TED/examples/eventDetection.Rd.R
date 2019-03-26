library(TED)


### Name: eventDetection
### Title: Detect events from time series
### Aliases: eventDetection

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
# specify a sliding window size and significant level
## Not run: 
##D w=128; alpha=0.05
##D events=eventDetection(x,w,'white',parallel=FALSE,alpha,'art')
## End(Not run)
##################################
#   2nd art eg (red noise)
##################################
set.seed(123)
# set a red noise level
coeff=0.5;s=1
# generated x with red noise as the background; this time series is the one used in
# Kang et al. (2014)
x=c(arima.sim(list(order = c(1,0,0),ar=coeff),n=500,sd=s),
    cbfs_red('rc'),arima.sim(list(order = c(1,0,0),ar=coeff),n=400,sd=s),
    cbfs_red('cr'),arima.sim(list(order = c(1,0,0),ar=coeff),n=400,sd=s),
    cbfs_red('box'),arima.sim(list(order = c(1,0,0),ar=coeff),n=400,sd=s),
    cbfs_red('sine'),arima.sim(list(order = c(1,0,0),ar=coeff),n=1000,sd=s),
    arima.sim(list(order = c(1,0,0),ar=0.8),n=1100,sd=4))
# specify a sliding window size and significant level
## Not run: 
##D w=128; alpha=0.05
##D # event detection
##D events=eventDetection(x,w,'red',parallel=FALSE,alpha,'art')
## End(Not run)
##################################
#   CASES-99 dataset (9.5m)
##################################
# window size which needs to be chosen by the user
w=120
# specify a significant level
alpha=0.05
# event detection from CASES99 data
## Not run: 
##D data(CASES99)
##D CASESevents=eventDetection(CASES99,w,'red',parallel=FALSE,alpha,'real')
## End(Not run)



