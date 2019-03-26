library(fields)


### Name: gcv.Krig
### Title: Finds profile likelihood and GCV estimates of smoothing
###   parameters for splines and Kriging.
### Aliases: gcv.Krig gcv.sreg
### Keywords: spatial

### ** Examples


# 
Tps( ChicagoO3$x, ChicagoO3$y)-> obj # default is to find lambda by GCV
summary( obj)

gcv.Krig( obj)-> out
print( out$lambda.est) # results agree with Tps summary

sreg( rat.diet$t, rat.diet$trt)-> out
gcv.sreg( out, tol=1e-10) # higher tolerance search for minimum 
## Not run: 
##D # a simulation example
##D x<- seq( 0,1,,150)
##D f<-  x**2*( 1-x)
##D f<- f/sqrt( var( f))
##D 
##D set.seed(123) # let's all use the same seed
##D sigma<- .1
##D y<- f + rnorm( 150)*sigma
##D 
##D Tps( x,y)-> obj # create Krig object
##D 
##D hold<- hold2<- matrix( NA, ncol=6, nrow=200)
##D 
##D for( k in 1:200){
##D # look at GCV estimates of lambda
##D # new data simulated
##D    y<- f + rnorm(150)*sigma 
##D # save GCV estimates
##D lambdaTable<- gcv.Krig(obj,  y=y, give.warnings=FALSE)$lambda.est
##D hold[k,]<-  lambdaTable[1,]
##D hold2[k,]<-  lambdaTable[6,]
##D }
##D matplot( cbind(hold[,2], hold2[,2]),cbind( hold[,4],hold2[,4]),
##D  xlab="estimated eff. df", ylab="sigma hat", pch=16, col=c("orange3", "green2"), type="p")
##D yline( sigma, col="grey", lwd=2)
##D 
## End(Not run)



