library(lmomco)


### Name: tlmrgpa
### Title: Compute Select TL-moment ratios of the Generalized Pareto
### Aliases: tlmrgpa
### Keywords: L-moment (trimmed, distribution) Distribution: Generalized
###   Pareto

### ** Examples

## Not run: 
##D tlmrgpa(leftrim=7, rightrim=2, xi=0, alpha=31)
##D tlmrgpa(leftrim=7, rightrim=2, xi=143, alpha=98) # another slow example
## End(Not run)
## Not run: 
##D   # Plot and L-moment ratio diagram of Tau3 and Tau4
##D   # with exclusive focus on the GPA distribution.
##D   plotlmrdia(lmrdia(), autolegend=TRUE, xleg=-.1, yleg=.6,
##D              xlim=c(-.8, .7), ylim=c(-.1, .8),
##D              nolimits=TRUE, nogev=TRUE, noglo=TRUE, nope3=TRUE,
##D              nogno=TRUE, nocau=TRUE, noexp=TRUE, nonor=TRUE,
##D              nogum=TRUE, noray=TRUE, nouni=TRUE)
##D 
##D   # Compute the TL-moment ratios for trimming of one
##D   # value on the left and four on the right. Notice the
##D   # expansion of the kappa parameter space from k > -1.
##D   J <- tlmrgpa(kbeg=-3.2, kend=50, by=.05, leftrim=1, rightrim=4)
##D   lines(J$tau3, J$tau4, lwd=2, col=2) # RED CURVE
##D   # Notice the gap in the curve near tau3 = 0.1
##D 
##D   # Compute the TL-moment ratios for trimming of four
##D   # values on the left and one on the right.
##D   J <- tlmrgpa(kbeg=-1.6, kend=8, leftrim=4, rightrim=1)
##D   lines(J$tau3, J$tau4, lwd=2, col=3) # GREEN CURVE
##D 
##D   # The kbeg and kend can be manually changed to see how
##D   # the resultant curve expands or contracts on the
##D   # extent of the L-moment ratio diagram.
## End(Not run)
## Not run: 
##D   # Following up, let us plot the two quantile functions
##D   LM  <- vec2par(c(0,1,0.99), type='gpa', paracheck=FALSE)
##D   TLM <- vec2par(c(0,1,3.00), type='gpa', paracheck=FALSE)
##D   F <- nonexceeds()
##D   plot(qnorm(F),  quagpa(F, LM), type="l")
##D   lines(qnorm(F), quagpa(F, TLM, paracheck=FALSE), col=2)
##D   # Notice how the TLM parameterization runs off towards
##D   # infinity much much earlier than the conventional
##D   # near limits of the GPA.
## End(Not run)



