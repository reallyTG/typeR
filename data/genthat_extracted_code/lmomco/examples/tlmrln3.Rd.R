library(lmomco)


### Name: tlmrln3
### Title: Compute Select TL-moment ratios of the 3-Parameter Log-Normal
###   Distribution
### Aliases: tlmrln3
### Keywords: L-moment (trimmed, distribution) Distribution: Log-Normal
###   (3-parameter)

### ** Examples

## Not run: 
##D   # Recalling that generalized Normal and log-Normal3 are
##D   # the same with the GNO being the more general.
##D 
##D   # Plot and L-moment ratio diagram of Tau3 and Tau4
##D   # with exclusive focus on the GNO distribution.
##D   plotlmrdia(lmrdia(), autolegend=TRUE, xleg=-.1, yleg=.6,
##D              xlim=c(-.8, .7), ylim=c(-.1, .8),
##D              nolimits=TRUE, noglo=TRUE, nogpa=TRUE, nope3=TRUE,
##D              nogev=TRUE, nocau=TRUE, noexp=TRUE, nonor=TRUE,
##D              nogum=TRUE, noray=TRUE, nouni=TRUE)
##D 
##D   LN3 <- tlmrln3(sbeg=.001, mulog=-1)
##D   lines(LN3$tau3, LN3$tau4) # See how it overplots the GNO
##D   # for right skewness. So only part of the GNO is covered.
##D 
##D   # Compute the TL-moment ratios for trimming of one
##D   # value on the left and four on the right.
##D   J <- tlmrgno(kbeg=-3.5, kend=3.9, leftrim=1, rightrim=4)
##D   lines(J$tau3, J$tau4, lwd=2, col=2) # RED CURVE
##D 
##D   LN3 <- tlmrln3(, leftrim=1, rightrim=4, sbeg=.001)
##D   lines(LN3$tau3, LN3$tau4) # See how it again over plots
##D   # only part of the GNO
## End(Not run)



