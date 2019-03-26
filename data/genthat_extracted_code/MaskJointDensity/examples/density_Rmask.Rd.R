library(MaskJointDensity)


### Name: density_Rmask
### Title: Density function
### Aliases: density_Rmask
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--  or do  help(data=index)  for the standard data sets.

y<-rnorm(100, 0,1)
val <- 1
for(k in 1:8){
   val<- c(val, mean(y^k))
   }
a<- -2
b<- 2
Provost<- density_Rmask(val, a,b)



