library(VGAM)


### Name: Zipois
### Title: Zero-Inflated Poisson Distribution
### Aliases: Zipois dzipois pzipois qzipois rzipois
### Keywords: distribution

### ** Examples

lambda <- 3; pstr0 <- 0.2; x <- (-1):7
(ii <- dzipois(x, lambda, pstr0 = pstr0))
max(abs(cumsum(ii) - pzipois(x, lambda, pstr0 = pstr0)))  # Should be 0
table(rzipois(100, lambda, pstr0 = pstr0))

table(qzipois(runif(100), lambda, pstr0))
round(dzipois(0:10, lambda, pstr0 = pstr0) * 100)  # Should be similar

## Not run: 
##D  x <- 0:10
##D par(mfrow = c(2, 1))  # Zero-inflated Poisson
##D barplot(rbind(dzipois(x, lambda, pstr0 = pstr0), dpois(x, lambda)),
##D         beside = TRUE, col = c("blue", "orange"),
##D         main = paste("ZIP(", lambda, ", pstr0 = ", pstr0, ") (blue) vs",
##D                      " Poisson(", lambda, ") (orange)", sep = ""),
##D         names.arg = as.character(x))
##D 
##D deflat.limit <- -1 / expm1(lambda)  # Zero-deflated Poisson
##D newpstr0 <- round(deflat.limit / 1.5, 3)
##D barplot(rbind(dzipois(x, lambda, pstr0 = newpstr0),
##D                 dpois(x, lambda)),
##D         beside = TRUE, col = c("blue","orange"),
##D         main = paste("ZDP(", lambda, ", pstr0 = ", newpstr0, ") (blue) vs",
##D                      " Poisson(", lambda, ") (orange)", sep = ""),
##D         names.arg = as.character(x)) 
## End(Not run)



