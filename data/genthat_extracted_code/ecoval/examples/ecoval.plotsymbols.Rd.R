library(ecoval)


### Name: ecoval.plotsymbols
### Title: Plot valuations of different sub-objectives as pie charts.
### Aliases: ecoval.plotsymbols

### ** Examples

plot(1, type="n",axes=FALSE,ann=FALSE,xlim=c(0, 10),ylim=c(0, 10))
u1 <- matrix(data=c(0.1,0.5,1,0.3,0.4,0.7),nrow=2,
             dimnames=list(c(NA,NA),c("morphology","hydrology","nutrients")))

ecoval.plotsymbols(nodes      = c("morphology","hydrology","nutrients"),
                   x          = c(1,2),
                   y          = c(7,8.5),
                   r          = 0.5,
                   u          = u1,
                   col        = utility.calc.colors(),
                   pos.legend = c(7,8.5),
                   cex.nodes  = 1)

u2 <- matrix(data=c(0.1,0.25,0.75,0.6),nrow=1,
             dimnames=list(NA,c("fish","algae","invertebrates","macrophytes")))

ecoval.plotsymbols(nodes      = c("fish","algae","invertebrates","macrophytes"),
                   x          = 1.5,
                   y          = 3,
                   r          = 0.5,
                   u          = u2,
                   square     = TRUE,
                   col        = utility.calc.colors(),
                   pos.legend = c(7,3),
                   cex.nodes  = 1)



