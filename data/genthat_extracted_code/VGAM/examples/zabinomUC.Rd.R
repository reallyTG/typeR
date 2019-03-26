library(VGAM)


### Name: Zabinom
### Title: Zero-Altered Binomial Distribution
### Aliases: Zabinom dzabinom pzabinom qzabinom rzabinom
### Keywords: distribution

### ** Examples

size <- 10; prob <- 0.15; pobs0 <- 0.05; x <- (-1):7
dzabinom(x, size = size, prob = prob, pobs0 = pobs0)
table(rzabinom(100, size = size, prob = prob, pobs0 = pobs0))

## Not run: 
##D  x <- 0:10
##D barplot(rbind(dzabinom(x, size = size, prob = prob, pobs0 = pobs0),
##D                 dbinom(x, size = size, prob = prob)),
##D         beside = TRUE, col = c("blue", "orange"), cex.main = 0.7, las = 1,
##D         ylab = "Probability", names.arg = as.character(x),
##D         main = paste("ZAB(size = ", size, ", prob = ", prob, ", pobs0 = ", pobs0,
##D                    ") [blue] vs",  " Binom(size = ", size, ", prob = ", prob,
##D                    ") [orange] densities", sep = "")) 
## End(Not run)



