library(segmented)


### Name: davies.test
### Title: Testing for a change in the slope
### Aliases: davies.test
### Keywords: htest

### ** Examples

## Not run: 
##D set.seed(20)
##D z<-runif(100)
##D x<-rnorm(100,2)
##D y<-2+10*pmax(z-.5,0)+rnorm(100,0,3)
##D 
##D o<-lm(y~z+x)
##D davies.test(o,~z)
##D davies.test(o,~x)
##D 
##D o<-glm(y~z+x)
##D davies.test(o,~z) #it works but the p-value is too small..
##D   
## End(Not run)



