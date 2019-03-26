library(nlts)


### Name: ll.order
### Title: Consistent nonlinear estimate of the order using local
###   polynomial regression.
### Aliases: ll.order
### Keywords: ts

### ** Examples


   data(plodia)

   fit <- ll.order(sqrt(plodia), order=1:3, bandwidth
               = seq(0.5, 1.5, by = 0.5)) 

    ## Not run: plot(fit)

    summary(fit)




