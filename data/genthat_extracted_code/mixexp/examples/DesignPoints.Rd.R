library(mixexp)


### Name: DesignPoints
### Title: This function plots design points and or constraints in the
###   simplex mixture space, given a data frame containing the design or
###   vextors x, y, and z of the same length that contain the mixture
###   components in the design.
### Aliases: DesignPoints
### Keywords: hplot

### ** Examples

dat<-SCD(3)
DesignPoints(des=dat)

x1<-c(1,0,0,.5,.5, 0,.33333)
x2<-c(0,1,0,.5,0,.5,.33333)
x3<-c(0,0,1,0,.5,.5,.33333)
DesignPoints(x=x3,y=x2,z=x1)

dat<-data.frame(x1,x2,x3)
DesignPoints(des=dat)




