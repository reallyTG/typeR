library(fields)


### Name: Krig.replicates
### Title: Collapse repeated spatial locations into unique locations
### Aliases: Krig.replicates
### Keywords: ~kwd1 ~kwd2

### ** Examples


#create  some spatial replicates
 set.seed( 123)
 x0<- matrix( runif(10*2), 10,2)
 x<-  x0[ c(rep(1,3), 2:8, rep( 9,5),10) , ]
 y<-  rnorm( 16)
 
 out<- Krig.replicates( x=x, y=y)
# compare 
# out$yM[1] ;  mean( y[1:3])
# out$yM[9] ; mean( y[11:15])
# mean( y[ out$rep.info==9])
 



