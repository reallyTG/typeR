library(segmented)


### Name: pscore.test
### Title: Testing for existence of one breakpoint
### Aliases: pscore.test
### Keywords: htest

### ** Examples

## Not run: 
##D set.seed(20)
##D z<-runif(100)
##D x<-rnorm(100,2)
##D y<-2+10*pmax(z-.5,0)+rnorm(100,0,3)
##D 
##D o<-lm(y~z+x)
##D 
##D #testing for one changepoint
##D #use the simple null fit
##D pscore.test(o,~z) #compare with davies.test(o,~z)..
##D 
##D #use the segmented fit
##D os<-segmented(o, ~z)
##D pscore.test(os,~z) #smaller p-value, as it uses the dispersion under the alternative (from 'os') 
##D 
##D #test for the 2nd breakpoint in the variable z
##D pscore.test(os,~z, more.break=TRUE) 
##D 
##D   
## End(Not run)



