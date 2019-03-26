library(VGAM)


### Name: Kumar
### Title: The Kumaraswamy Distribution
### Aliases: Kumar dkumar pkumar qkumar rkumar
### Keywords: distribution

### ** Examples

## Not run: 
##D shape1 <- 2; shape2 <- 2; nn <- 201; # shape1 <- shape2 <- 0.5;
##D x <- seq(-0.05, 1.05, len = nn)
##D plot(x, dkumar(x, shape1, shape2), type = "l", las = 1, ylim = c(0,1.5),
##D      ylab = paste("fkumar(shape1 = ", shape1, ", shape2 = ", shape2, ")"),
##D      col = "blue", cex.main = 0.8,
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Purple lines are the 10,20,...,90 percentiles")
##D lines(x, pkumar(x, shape1, shape2), col = "orange")
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qkumar(probs, shape1, shape2)
##D lines(Q, dkumar(Q, shape1, shape2), col = "purple", lty = 3, type = "h")
##D lines(Q, pkumar(Q, shape1, shape2), col = "purple", lty = 3, type = "h")
##D abline(h = probs, col = "purple", lty = 3)
##D max(abs(pkumar(Q, shape1, shape2) - probs))  # Should be 0
## End(Not run)



