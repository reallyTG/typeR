library(sppmix)


### Name: plot2dPP
### Title: Plot a spatial point pattern
### Aliases: plot2dPP

### ** Examples

## No test: 
mix1 <- rnormmix(5, sig0 = .01, df = 5, xlim=c(0, 5), ylim=c(0, 5))
intsurf1=to_int_surf(mix1, lambda = 40, win =spatstat::owin( c(0, 5),c(0, 5)))
pp1 <- rsppmix(intsurf1)
plot2dPP(pp1)
plot2dPP(pp1, mus = intsurf1$mus)
## End(No test)




