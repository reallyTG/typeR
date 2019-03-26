library(MaskJointDensity)


### Name: findOrder_Rmask
### Title: order determination
### Aliases: findOrder_Rmask
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--  or do  help(data=index)  for the standard data sets.
## No test: 
y<-rnorm(100,0,1)
noise<-abs(rnorm(100,2,4))
ystar<- noise*y
a<- -2
b<- 2
order<-findOrder_Rmask(ystar,noise,a,b,maxorder=100, EPS=1e-06)
print(order)
## End(No test)



