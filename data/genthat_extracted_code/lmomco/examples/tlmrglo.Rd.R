library(lmomco)


### Name: tlmrglo
### Title: Compute Select TL-moment ratios of the Generalized Logistic
###   Distribution
### Aliases: tlmrglo
### Keywords: L-moment (trimmed, distribution) Distribution: Generalized
###   Logistic

### ** Examples

## Not run: 
##D tlmrglo(leftrim=1, rightrim=3, xi=0, alpha=4)
##D tlmrglo(leftrim=1, rightrim=3, xi=32, alpha=83) # another slow example
## End(Not run)
## Not run: 
##D   # Plot and L-moment ratio diagram of Tau3 and Tau4
##D   # with exclusive focus on the GLO distribution.
##D   plotlmrdia(lmrdia(), autolegend=TRUE, xleg=-.1, yleg=.6,
##D              xlim=c(-.8, .7), ylim=c(-.1, .8),
##D              nolimits=TRUE, nogev=TRUE, nogpa=TRUE, nope3=TRUE,
##D              nogno=TRUE, nocau=TRUE, noexp=TRUE, nonor=TRUE,
##D              nogum=TRUE, noray=TRUE, nouni=TRUE)
##D 
##D   # Compute the TL-moment ratios for trimming of one
##D   # value on the left and four on the right. Notice the
##D   # expansion of the kappa parameter space from
##D   # -1 < k < -1 to something larger based on manual
##D   # adjustments until blue curve encompassed the plot.
##D   J <- tlmrglo(kbeg=-2.5, kend=1.9, leftrim=1, rightrim=4)
##D   lines(J$tau3, J$tau4, lwd=2, col=2) # RED CURVE
##D 
##D   # Compute the TL-moment ratios for trimming of four
##D   # values on the left and one on the right.
##D   J <- tlmrglo(kbeg=-1.65, kend=3, leftrim=4, rightrim=1)
##D   lines(J$tau3, J$tau4, lwd=2, col=4) # BLUE CURVE
##D 
##D   # The kbeg and kend can be manually changed to see how
##D   # the resultant curve expands or contracts on the
##D   # extent of the L-moment ratio diagram.
## End(Not run)
## Not run: 
##D   # Following up, let us plot the two quantile functions
##D   LM  <- vec2par(c(0,1,0.99), type='glo', paracheck=FALSE)
##D   TLM <- vec2par(c(0,1,3.00), type='glo', paracheck=FALSE)
##D   F <- nonexceeds()
##D   plot(qnorm(F),  quaglo(F, LM), type="l")
##D   lines(qnorm(F), quaglo(F, TLM, paracheck=FALSE), col=2)
##D   # Notice how the TLM parameterization runs off towards
##D   # infinity much much earlier than the conventional
##D   # near limits of the GLO.
## End(Not run)



