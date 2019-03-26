library(lmomco)


### Name: tlmrgno
### Title: Compute Select TL-moment ratios of the Generalized Normal
###   Distribution
### Aliases: tlmrgno
### Keywords: L-moment (trimmed, distribution) Distribution: Generalized
###   Normal

### ** Examples

## Not run: 
##D tlmrgno(leftrim=3, rightrim=2, xi=0, alpha=2)
##D tlmrgno(leftrim=3, rightrim=2, xi=120, alpha=55) # another slow example
## End(Not run)
## Not run: 
##D   # Plot and L-moment ratio diagram of Tau3 and Tau4
##D   # with exclusive focus on the GNO distribution.
##D   plotlmrdia(lmrdia(), autolegend=TRUE, xleg=-.1, yleg=.6,
##D              xlim=c(-.8, .7), ylim=c(-.1, .8),
##D              nolimits=TRUE, nogev=TRUE, nogpa=TRUE, nope3=TRUE,
##D              noglo=TRUE, nocau=TRUE, noexp=TRUE, nonor=TRUE,
##D              nogum=TRUE, noray=TRUE, nouni=TRUE)
##D 
##D   # Compute the TL-moment ratios for trimming of one
##D   # value on the left and four on the right.
##D   J <- tlmrgno(kbeg=-3.5, kend=3.9, leftrim=1, rightrim=4)
##D   lines(J$tau3, J$tau4, lwd=2, col=2) # RED CURVE
##D 
##D   # Compute the TL-moment ratios for trimming of four
##D   # values on the left and one on the right.
##D   J <- tlmrgno(kbeg=-4, kend=4, leftrim=4, rightrim=1)
##D   lines(J$tau3, J$tau4, lwd=2, col=4) # BLUE CURVE
##D 
##D   # The kbeg and kend can be manually changed to see how
##D   # the resultant curve expands or contracts on the
##D   # extent of the L-moment ratio diagram.
## End(Not run)
## Not run: 
##D   # Following up, let us plot the two quantile functions
##D   LM  <- vec2par(c(0,1,0.99), type='gno', paracheck=FALSE)
##D   TLM <- vec2par(c(0,1,3.00), type='gno', paracheck=FALSE)
##D   F <- nonexceeds()
##D   plot(qnorm(F),  quagno(F, LM), type="l")
##D   lines(qnorm(F), quagno(F, TLM, paracheck=FALSE), col=2)
##D   # Notice how the TLM parameterization runs off towards
##D   # infinity much much earlier than the conventional
##D   # near limits of the GNO.
## End(Not run)



