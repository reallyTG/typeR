library(lmomco)


### Name: tlmrpe3
### Title: Compute Select TL-moment ratios of the Pearson Type III
### Aliases: tlmrpe3
### Keywords: L-moment (trimmed, distribution) Distribution: Pearson Type
###   III

### ** Examples

## Not run: 
##D tlmrpe3(leftrim=2, rightrim=4, xi=0, beta=2)
##D tlmrpe3(leftrim=2, rightrim=4, xi=100, beta=20) # another slow example
##D   # Plot and L-moment ratio diagram of Tau3 and Tau4
##D   # with exclusive focus on the PE3 distribution.
##D   plotlmrdia(lmrdia(), autolegend=TRUE, xleg=-.1, yleg=.6,
##D              xlim=c(-.8, .7), ylim=c(-.1, .8),
##D              nolimits=TRUE, nogev=TRUE, nogpa=TRUE, noglo=TRUE,
##D              nogno=TRUE, nocau=TRUE, noexp=TRUE, nonor=TRUE,
##D              nogum=TRUE, noray=TRUE, nouni=TRUE)
##D 
##D   # Compute the TL-moment ratios for trimming of one
##D   # value on the left and four on the right. Notice the
##D   # expansion of the alpha parameter space from
##D   # -1 < a < -1 to something larger based on manual
##D   # adjustments until blue curve encompassed the plot.
##D   J <- tlmrpe3(abeg=-15, aend=6, leftrim=1, rightrim=4)
##D   lines(J$tau3, J$tau4, lwd=2, col=2) # RED CURVE
##D 
##D   # Compute the TL-moment ratios for trimming of four
##D   # values on the left and one on the right.
##D   J <- tlmrpe3(abeg=-6, aend=10, leftrim=4, rightrim=1)
##D   lines(J$tau3, J$tau4, lwd=2, col=4) # BLUE CURVE
##D 
##D   # The abeg and aend can be manually changed to see how
##D   # the resultant curve expands or contracts on the
##D   # extent of the L-moment ratio diagram.
## End(Not run)
## Not run: 
##D   # Following up, let us plot the two quantile functions
##D   LM  <- vec2par(c(0,1,0.99), type='pe3', paracheck=FALSE)
##D   TLM <- vec2par(c(0,1,3.00), type='pe3', paracheck=FALSE)
##D   F <- nonexceeds()
##D   plot(qnorm(F),  quape3(F, LM), type="l")
##D   lines(qnorm(F), quape3(F, TLM, paracheck=FALSE), col=2)
##D   # Notice how the TLM parameterization runs off towards
##D   # infinity much much earlier than the conventional
##D   # near limits of the PE3.
## End(Not run)



