library(VGAM)


### Name: Zageom
### Title: Zero-Altered Geometric Distribution
### Aliases: Zageom dzageom pzageom qzageom rzageom
### Keywords: distribution

### ** Examples

prob <- 0.35; pobs0 <- 0.05; x <- (-1):7
dzageom(x, prob = prob, pobs0 = pobs0)
table(rzageom(100, prob = prob, pobs0 = pobs0))

## Not run: 
##D  x <- 0:10
##D barplot(rbind(dzageom(x, prob = prob, pobs0 = pobs0),
##D                 dgeom(x, prob = prob)),
##D         beside = TRUE, col = c("blue", "orange"), cex.main = 0.7, las = 1,
##D         ylab = "Probability", names.arg = as.character(x),
##D         main = paste("ZAG(prob = ", prob, ", pobs0 = ", pobs0,
##D                    ") [blue] vs",  " Geometric(prob = ", prob,
##D                    ") [orange] densities", sep = "")) 
## End(Not run)



