library(TSA)


### Name: gBox
### Title: Generalized Portmanteau Tests for GARCH Models
### Aliases: gBox
### Keywords: methods

### ** Examples

## No test: 
# library(tseries) # need to uncomment this line when running the example
data(CREF)
r.cref=diff(log(CREF))*100
m1=garch(x=r.cref,order=c(1,1))
summary(m1)
#gBox(m1,x=r.cref,method='squared')
## End(No test)



