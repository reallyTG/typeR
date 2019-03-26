library(VGAM)


### Name: Pospois
### Title: Positive-Poisson Distribution
### Aliases: Pospois dpospois ppospois qpospois rpospois
### Keywords: distribution

### ** Examples

lambda <- 2; y = rpospois(n = 1000, lambda)
table(y)
mean(y)  # Sample mean
lambda / (1 - exp(-lambda))  # Population mean

(ii <- dpospois(0:7, lambda))
cumsum(ii) - ppospois(0:7, lambda)  # Should be 0s
table(rpospois(100, lambda))

table(qpospois(runif(1000), lambda))
round(dpospois(1:10, lambda) * 1000)  # Should be similar

## Not run: 
##D  x <- 0:7
##D barplot(rbind(dpospois(x, lambda), dpois(x, lambda)),
##D         beside = TRUE, col = c("blue", "orange"),
##D         main = paste("Positive Poisson(", lambda, ") (blue) vs",
##D         " Poisson(", lambda, ") (orange)", sep = ""),
##D         names.arg = as.character(x), las = 1, lwd = 2) 
## End(Not run)



