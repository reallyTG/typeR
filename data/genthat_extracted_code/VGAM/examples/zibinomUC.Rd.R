library(VGAM)


### Name: Zibinom
### Title: Zero-Inflated Binomial Distribution
### Aliases: Zibinom dzibinom pzibinom qzibinom rzibinom
### Keywords: distribution

### ** Examples

prob <- 0.2; size <- 10; pstr0 <- 0.5
(ii <- dzibinom(0:size, size, prob, pstr0 = pstr0))
max(abs(cumsum(ii) - pzibinom(0:size, size, prob, pstr0 = pstr0)))  # Should be 0
table(rzibinom(100, size, prob, pstr0 = pstr0))

table(qzibinom(runif(100), size, prob, pstr0 = pstr0))
round(dzibinom(0:10, size, prob, pstr0 = pstr0) * 100)  # Should be similar

## Not run: 
##D  x <- 0:size
##D barplot(rbind(dzibinom(x, size, prob, pstr0 = pstr0),
##D                 dbinom(x, size, prob)),
##D         beside = TRUE, col = c("blue", "green"), ylab = "Probability",
##D         main = paste("ZIB(", size, ", ", prob, ", pstr0 = ", pstr0, ") (blue) vs",
##D                      " Binomial(", size, ", ", prob, ") (green)", sep=""),
##D         names.arg = as.character(x), las = 1, lwd = 2) 
## End(Not run)



