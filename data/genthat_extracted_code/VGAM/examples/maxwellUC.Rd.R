library(VGAM)


### Name: Maxwell
### Title: The Maxwell Distribution
### Aliases: Maxwell dmaxwell pmaxwell qmaxwell rmaxwell
### Keywords: distribution

### ** Examples

## Not run: 
##D  rate <- 3; x <- seq(-0.5, 3, length = 100)
##D plot(x, dmaxwell(x, rate = rate), type = "l", col = "blue", las = 1,
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Purple lines are the 10,20,...,90 percentiles", ylab = "")
##D abline(h = 0, col = "blue", lty = 2)
##D lines(x, pmaxwell(x, rate = rate), type = "l", col = "orange")
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qmaxwell(probs, rate = rate)
##D lines(Q, dmaxwell(Q, rate), col = "purple", lty = 3, type = "h")
##D lines(Q, pmaxwell(Q, rate), col = "purple", lty = 3, type = "h")
##D abline(h = probs, col = "purple", lty = 3)
##D max(abs(pmaxwell(Q, rate) - probs))  # Should be zero
## End(Not run)



