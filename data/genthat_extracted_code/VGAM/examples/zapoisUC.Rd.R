library(VGAM)


### Name: Zapois
### Title: Zero-Altered Poisson Distribution
### Aliases: Zapois dzapois pzapois qzapois rzapois
### Keywords: distribution

### ** Examples

lambda <- 3; pobs0 <- 0.2; x <- (-1):7
(ii <- dzapois(x, lambda, pobs0))
max(abs(cumsum(ii) - pzapois(x, lambda, pobs0)))  # Should be 0
table(rzapois(100, lambda, pobs0))
table(qzapois(runif(100), lambda, pobs0))
round(dzapois(0:10, lambda, pobs0) * 100)  # Should be similar

## Not run: 
##D  x <- 0:10
##D barplot(rbind(dzapois(x, lambda, pobs0), dpois(x, lambda)),
##D         beside = TRUE, col = c("blue", "green"), las = 1,
##D         main = paste("ZAP(", lambda, ", pobs0 = ", pobs0, ") [blue] vs",
##D                    " Poisson(", lambda, ") [green] densities", sep = ""),
##D         names.arg = as.character(x), ylab = "Probability") 
## End(Not run)



