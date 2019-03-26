library(gdata)


### Name: reorder.factor
### Title: Reorder the Levels of a Factor
### Aliases: reorder.factor
### Keywords: manip

### ** Examples


## Don't show: 
    set.seed(123456)
## End(Don't show)

   # Create a 4 level example factor
   trt <- factor( sample( c("PLACEBO", "300 MG", "600 MG", "1200 MG"),
                  100, replace=TRUE ) )
   summary(trt)
   # Note that the levels are not in a meaningful order.

   # Change the order to something useful..
   # - default "mixedsort" ordering
   trt2 <- reorder(trt)
   summary(trt2)
   # - using indexes:
   trt3 <- reorder(trt, new.order=c(4, 2, 3, 1))
   summary(trt3)
   # - using label names:
   trt4 <- reorder(trt, new.order=c("PLACEBO", "300 MG", "600 MG", "1200 MG"))
   summary(trt4)
   # - using frequency
   trt5 <- reorder(trt, X=rnorm(100), FUN=mean)
   summary(trt5)

   # Drop out the '300 MG' level
   trt6 <- reorder(trt, new.order=c("PLACEBO", "600 MG", "1200 MG"))
   summary(trt6)



