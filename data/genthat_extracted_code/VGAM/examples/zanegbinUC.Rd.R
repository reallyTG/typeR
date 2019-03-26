library(VGAM)


### Name: Zanegbin
### Title: Zero-Altered Negative Binomial Distribution
### Aliases: Zanegbin dzanegbin pzanegbin qzanegbin rzanegbin
### Keywords: distribution

### ** Examples

munb <- 3; size <- 4; pobs0 <- 0.3; x <- (-1):7
dzanegbin(x, munb = munb, size = size, pobs0 = pobs0)
table(rzanegbin(100, munb = munb, size = size, pobs0 = pobs0))

## Not run: 
##D  x <- 0:10
##D barplot(rbind(dzanegbin(x, munb = munb, size = size, pobs0 = pobs0),
##D                 dnbinom(x, mu   = munb, size = size)),
##D         beside = TRUE, col = c("blue", "green"), cex.main = 0.7, las = 1,
##D         ylab = "Probability", names.arg = as.character(x),
##D         main = paste("ZANB(munb = ", munb, ", size = ", size,",
##D                      pobs0 = ", pobs0,
##D                    ") [blue] vs",  " NB(mu = ", munb, ", size = ", size,
##D                    ") [green] densities", sep = "")) 
## End(Not run)



