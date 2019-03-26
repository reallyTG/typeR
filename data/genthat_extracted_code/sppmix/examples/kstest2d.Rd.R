library(sppmix)


### Name: kstest2d
### Title: Nonparametric Goodness-of-fit test between two point patterns
### Aliases: kstest2d

### ** Examples

## No test: 
# generate two point patterns
mix1 <- rnormmix(3, sig0 = .01, df = 5, xlim=c(0, 5), ylim=c(0, 5))
intsurf1=to_int_surf(mix1,lambda = 40, win =spatstat::owin( c(0, 5),c(0, 5)))
mix2 <- rnormmix(8, sig0 = .01, df = 10, xlim=c(0, 5),ylim=c(0, 5))
intsurf2=to_int_surf(mix2,lambda = 50, win =spatstat::owin( c(0, 5),c(0, 5)))
#generate patterns from the two different models
pp1 <- rsppmix(intsurf1)
pp2 <- rsppmix(intsurf2)
pp3 <- rsppmix(intsurf2)#pp3 is from the same model as pp2
# Test for goodness of fit, p-value should be small
kstest2d(pp1, pp2)
# Test for goodness of fit, p-value should be large
kstest2d(pp2, pp3)
## End(No test)




