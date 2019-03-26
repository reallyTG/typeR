library(VGAM)


### Name: Zinegbin
### Title: Zero-Inflated Negative Binomial Distribution
### Aliases: Zinegbin dzinegbin pzinegbin qzinegbin rzinegbin
### Keywords: distribution

### ** Examples

munb <- 3; pstr0 <- 0.2; size <- k <- 10; x <- 0:10
(ii <- dzinegbin(x, pstr0 = pstr0, mu = munb, size = k))
max(abs(cumsum(ii) - pzinegbin(x, pstr0 = pstr0, mu = munb, size = k)))  # 0
table(rzinegbin(100, pstr0 = pstr0, mu = munb, size = k))

table(qzinegbin(runif(1000), pstr0 = pstr0, mu = munb, size = k))
round(dzinegbin(x, pstr0 = pstr0, mu = munb, size = k) * 1000)  # Should be similar

## Not run: 
##D barplot(rbind(dzinegbin(x, pstr0 = pstr0, mu = munb, size = k),
##D                 dnbinom(x, mu = munb, size = k)), las = 1,
##D         beside = TRUE, col = c("blue", "green"), ylab = "Probability",
##D         main = paste("ZINB(mu = ", munb, ", k = ", k, ", pstr0 = ", pstr0,
##D                    ") (blue) vs NB(mu = ", munb,
##D                    ", size = ", k, ") (green)", sep = ""),
##D         names.arg = as.character(x)) 
## End(Not run)



