library(spatstat)


### Name: Softcore
### Title: The Soft Core Point Process Model
### Aliases: Softcore
### Keywords: spatial models

### ** Examples

   # fit the stationary Soft Core process to `cells' 
   fit5 <- ppm(cells ~1, Softcore(kappa=0.5), correction="isotropic")

   # study shape of interaction and explore effect of parameters
   fit2 <- update(fit5, Softcore(kappa=0.2))
   fit8 <- update(fit5, Softcore(kappa=0.8))
   plot(fitin(fit2), xlim=c(0, 0.4),
        main="Pair potential (sigma = 0.1)", 
        xlab=expression(d), ylab=expression(h(d)), legend=FALSE)
   plot(fitin(fit5), add=TRUE, col=4)
   plot(fitin(fit8), add=TRUE, col=3)
   legend("bottomright", col=c(1,4,3), lty=1,
          legend=expression(kappa==0.2, kappa==0.5, kappa==0.8))



