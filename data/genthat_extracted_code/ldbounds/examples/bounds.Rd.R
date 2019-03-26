library(ldbounds)


### Name: bounds
### Title: Group Sequential Boundaries Using Spending Functions
### Aliases: bounds
### Keywords: misc

### ** Examples

   ## From Reboussin, et al. (2000)

   t <- seq(0.2,1,length=5)
   obf.bd <- bounds(t,iuse=c(1,1),alpha=c(0.025,0.025))
   summary(obf.bd)
   plot(obf.bd)

   t <- c(0.2292,0.3333,0.4375,0.5833,0.7083,0.8333)
   t2 <- c(56,77,126,177,247,318)
   power.fam <- bounds(t,t2,iuse=c(3,3),alpha=c(0.025,0.025))
   summary(power.fam)




