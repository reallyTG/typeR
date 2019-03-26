library(wordspace)


### Name: dsm.score
### Title: Weighting, Scaling and Normalisation of Co-occurrence Matrix
###   (wordspace)
### Aliases: dsm.score

### ** Examples

model <- DSM_TermTerm
model$M # raw co-occurrence matrix
  
model <- dsm.score(model, score="MI")
round(model$S, 3) # PPMI scores
  
model <- dsm.score(model, score="reweight", transform="sigmoid")
round(model$S, 3) # additional sigmoid transformation
  
## Not run: 
##D # visualization of the scale transformations implemented by dsm.score
##D x <- seq(-2, 4, .025)
##D plot(x, x, type="l", lwd=2, xaxs="i", yaxs="i", xlab="x", ylab="f(x)")
##D abline(h=0, lwd=0.5); abline(v=0, lwd=0.5)
##D lines(x, sign(x) * log(abs(x) + 1), lwd=2, col=2)
##D lines(x, sign(x) * sqrt(abs(x)), lwd=2, col=3)
##D lines(x, tanh(x), lwd=2, col=4)
##D legend("topleft", inset=.05, bg="white", lwd=3, col=1:4,
##D        legend=c("none", "log", "root", "sigmoid"))
## End(Not run)



