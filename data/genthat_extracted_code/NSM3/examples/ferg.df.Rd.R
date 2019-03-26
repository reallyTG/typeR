library(NSM3)


### Name: ferg.df
### Title: Ferguson's Estimator
### Aliases: ferg.df
### Keywords: Ferguson

### ** Examples

##Hollander-Wolfe-Chicken Figure 16.2
framingham<-c(2273, 2710, 141, 4725, 5010, 6224, 4991, 458, 1587, 1435, 2565, 1863)
plot.ecdf(framingham)
lines(sort(framingham),pexp(sort(framingham), 1/2922), lty=3)
temp.x = seq(min(framingham), max(framingham), length.out=100)
lines(temp.x,ferg.df(sort(framingham), 4, npoints=100,pexp,1/2922), col=2, type="s", lty=2)
legend("bottomright",  lty=c(1,3,2), legend=c("ecdf", "prior", "ferguson"), col=c(1,1,2))



