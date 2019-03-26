library(spatstat)


### Name: envelope
### Title: Simulation Envelopes of Summary Function
### Aliases: envelope envelope.ppp envelope.ppm envelope.kppm
### Keywords: spatial htest hplot iteration

### ** Examples

 X <- simdat

 # Envelope of K function under CSR
 ## Not run: 
##D  plot(envelope(X))
##D  
## End(Not run)
 ## Don't show: 
  plot(envelope(X, nsim=3))
 
## End(Don't show)

 # Translation edge correction (this is also FASTER):
 ## Not run: 
##D  plot(envelope(X, correction="translate"))
##D  
## End(Not run)
 ## Don't show: 
  E <- envelope(X, nsim=3, correction="translate")
 
## End(Don't show)

# Global envelopes
 ## Not run: 
##D  plot(envelope(X, Lest, global=TRUE))
##D  plot(envelope(X, Kest,  global=TRUE, scale=function(r) { r }))
##D  
## End(Not run)
 ## Don't show: 
  E <- envelope(X, Lest, nsim=3, global=TRUE)
  E <- envelope(X, Kest, nsim=3, global=TRUE, scale=function(r) { r })
  E
  summary(E)
 
## End(Don't show)

 # Envelope of K function for simulations from Gibbs model 
 ## Not run: 
##D  fit <- ppm(cells ~1, Strauss(0.05))
##D  plot(envelope(fit))
##D  plot(envelope(fit), global=TRUE)
##D  
## End(Not run)
 ## Don't show: 
  fit <- ppm(cells ~1, Strauss(0.05), nd=20)
  E <- envelope(fit, nsim=3, correction="border", nrep=100)
  E <- envelope(fit, nsim=3, correction="border", global=TRUE, nrep=100)
 
## End(Don't show)

 # Envelope of K function for simulations from cluster model 
 fit <- kppm(redwood ~1, "Thomas")
 ## Not run: 
##D  plot(envelope(fit, Gest))
##D  plot(envelope(fit, Gest, global=TRUE))
##D  
## End(Not run)
 ## Don't show: 
  E <- envelope(fit, Gest, correction="rs", nsim=3, global=TRUE, nrep=100)
 
## End(Don't show)

 # Envelope of G function under CSR
 ## Not run: 
##D  plot(envelope(X, Gest))
##D  
## End(Not run)
 ## Don't show: 
  E <- envelope(X, Gest, correction="rs", nsim=3)
 
## End(Don't show)

 # Envelope of L function under CSR
 #  L(r) = sqrt(K(r)/pi)
 ## Not run: 
##D   E <- envelope(X, Kest)
##D   plot(E, sqrt(./pi) ~ r)
##D  
## End(Not run)
 ## Don't show: 
  E <- envelope(X, Kest, correction="border", nsim=3)
  plot(E, sqrt(./pi) ~ r)
 
## End(Don't show)

 # Simultaneous critical envelope for L function
 # (alternatively, use Lest)
 ## Not run: 
##D   plot(envelope(X, Kest, transform=expression(sqrt(./pi)), global=TRUE))
##D  
## End(Not run)
 ## Don't show: 
  E <- envelope(X, Kest, nsim=3, correction="border",
               transform=expression(sqrt(./pi)), global=TRUE)
 
## End(Don't show)

 ## One-sided envelope
 ## Not run: 
##D   plot(envelope(X, Lest, alternative="less"))
##D  
## End(Not run)
 ## Don't show: 
  E <- envelope(X, Lest, nsim=3, alternative="less")
 
## End(Don't show)
 
 # How to pass arguments needed to compute the summary functions:
 # We want envelopes for Jcross(X, "A", "B") 
 # where "A" and "B" are types of points in the dataset 'demopat'

 data(demopat)
 ## Not run: 
##D  plot(envelope(demopat, Jcross, i="A", j="B"))
##D  
## End(Not run)
 ## Don't show: 
 plot(envelope(demopat, Jcross, correction="rs", i="A", j="B", nsim=3))
 
## End(Don't show)
 
 # Use of `simulate'
 ## Not run: 
##D  plot(envelope(cells, Gest, simulate=expression(runifpoint(42))))
##D  plot(envelope(cells, Gest, simulate=expression(rMaternI(100,0.02))))
##D  
## End(Not run)
 ## Don't show: 
  plot(envelope(cells, Gest, correction="rs", simulate=expression(runifpoint(42)), nsim=3))
    plot(envelope(cells, Gest, correction="rs", simulate=expression(rMaternI(100, 0.02)),
nsim=3, global=TRUE))
 
## End(Don't show)

 # Envelope under random toroidal shifts
 data(amacrine)
 ## Not run: 
##D  plot(envelope(amacrine, Kcross, i="on", j="off",
##D                simulate=expression(rshift(amacrine, radius=0.25)))) 
##D  
## End(Not run)

 # Envelope under random shifts with erosion
 ## Not run: 
##D  plot(envelope(amacrine, Kcross, i="on", j="off",
##D               simulate=expression(rshift(amacrine, radius=0.1, edge="erode"))))
##D  
## End(Not run)
  
 # Envelope of INHOMOGENEOUS K-function with fitted trend

 # The following is valid.
 # Setting lambda=fit means that the fitted model is re-fitted to
 # each simulated pattern to obtain the intensity estimates for Kinhom.
 # (lambda=NULL would also be valid)

 fit <- kppm(redwood ~1, clusters="MatClust")
 ## Not run: 
##D     plot(envelope(fit, Kinhom, lambda=fit, nsim=19))
##D  
## End(Not run)
 ## Don't show: 
    envelope(fit, Kinhom, lambda=fit, nsim=3)
 
## End(Don't show)

 # Note that the principle of symmetry, essential to the validity of
 # simulation envelopes, requires that both the observed and
 # simulated patterns be subjected to the same method of intensity
 # estimation. In the following example it would be incorrect to set the
 # argument 'lambda=red.dens' in the envelope command, because this
 # would mean that the inhomogeneous K functions of the simulated
 # patterns would be computed using the intensity function estimated
 # from the original redwood data, violating the symmetry.  There is
 # still a concern about the fact that the simulations are generated
 # from a model that was fitted to the data; this is only a problem in
 # small datasets.

## Not run: 
##D  red.dens <- density(redwood, sigma=bw.diggle)
##D  plot(envelope(redwood, Kinhom, sigma=bw.diggle,
##D          simulate=expression(rpoispp(red.dens))))
##D  
## End(Not run)

 # Precomputed list of point patterns
## Not run: 
##D  nX <- npoints(X)
##D  PatList <- list()
##D  for(i in 1:19) PatList[[i]] <- runifpoint(nX)
##D  E <- envelope(X, Kest, nsim=19, simulate=PatList)
## End(Not run)
## Don't show: 
 PatList <- list()
 for(i in 1:3) PatList[[i]] <- runifpoint(10)
 E <- envelope(X, Kest, nsim=3, simulate=PatList)
## End(Don't show)

# re-using the same point patterns
## Not run: 
##D  EK <- envelope(X, Kest, savepatterns=TRUE)
##D  EG <- envelope(X, Gest, simulate=EK)
## End(Not run)
## Don't show: 
 EK <- envelope(X, Kest, nsim=3, savepatterns=TRUE)
 EG <- envelope(X, Gest, nsim=3, simulate=EK)
## End(Don't show)



