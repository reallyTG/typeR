library(TSA)


### Name: arima.boot
### Title: Compute the Bootstrap Estimates of an ARIMA Model
### Aliases: arima.boot
### Keywords: methods

### ** Examples

## No test: 
data(hare)
arima.hare=arima(sqrt(hare),order=c(3,0,0))
boot.hare=arima.boot(arima.hare,B=50,init=sqrt(hare)[1:3],ntrans=100)
apply(boot.hare,2,quantile, c(.025,.975))
period.boot=apply(boot.hare,1,function(x){
roots=polyroot(c(1,-x[1:3]))
min1=1.e+9
rootc=NA
for (root in roots) {
if( abs(Im(root))<1e-10) next
if (Mod(root)< min1) {min1=Mod(root); rootc=root}
}
if(is.na(rootc)) period=NA else period=2*pi/abs(Arg(rootc))
period
})
hist(period.boot)
quantile(period.boot,c(0.025,.975))
## End(No test)



