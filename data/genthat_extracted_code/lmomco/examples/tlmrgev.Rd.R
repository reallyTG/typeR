library(lmomco)


### Name: tlmrgev
### Title: Compute Select TL-moment ratios of the Generalized Extreme Value
###   Distribution
### Aliases: tlmrgev
### Keywords: L-moment (trimmed, distribution) Distribution: Generalized
###   Extreme Value

### ** Examples

## Not run: 
##D tlmrgev(leftrim=12, rightrim=1, xi=0,   alpha=2 )
##D tlmrgev(leftrim=12, rightrim=1, xi=100, alpha=20) # another slow example
## End(Not run)
## Not run: 
##D   # Plot and L-moment ratio diagram of Tau3 and Tau4
##D   # with exclusive focus on the GEV distribution.
##D   plotlmrdia(lmrdia(), autolegend=TRUE, xleg=-.1, yleg=.6,
##D              xlim=c(-.8, .7), ylim=c(-.1, .8),
##D              nolimits=TRUE, noglo=TRUE, nogpa=TRUE, nope3=TRUE,
##D              nogno=TRUE, nocau=TRUE, noexp=TRUE, nonor=TRUE,
##D              nogum=TRUE, noray=TRUE, nouni=TRUE)
##D 
##D   # Compute the TL-moment ratios for trimming of one
##D   # value on the left and four on the right. Notice the
##D   # expansion of the kappa parameter space from > -1 to
##D   # something near -5.
##D   J <- tlmrgev(kbeg=-4.99, leftrim=1, rightrim=4)
##D   lines(J$tau3, J$tau4, lwd=2, col=3) # BLUE CURVE
##D 
##D   # Compute the TL-moment ratios for trimming of four
##D   # values on the left and one on the right.
##D   J <- tlmrgev(kbeg=-1.99, leftrim=4, rightrim=1)
##D   lines(J$tau3, J$tau4, lwd=2, col=4) # GREEN CURVE
##D 
##D   # The kbeg and kend can be manually changed to see how
##D   # the resultant curve expands or contracts on the
##D   # extent of the L-moment ratio diagram.
## End(Not run)
## Not run: 
##D   # Following up, let us plot the two quantile functions
##D   LM  <- vec2par(c(0,1,-0.99), type='gev', paracheck=FALSE)
##D   TLM <- vec2par(c(0,1,-4.99), type='gev', paracheck=FALSE)
##D   F <- nonexceeds()
##D   plot(qnorm(F),  quagev(F, LM), type="l")
##D   lines(qnorm(F), quagev(F, TLM, paracheck=FALSE), col=2)
##D   # Notice how the TLM parameterization runs off towards
##D   # infinity much much earlier than the conventional
##D   # near limits of the GEV.
## End(Not run)



