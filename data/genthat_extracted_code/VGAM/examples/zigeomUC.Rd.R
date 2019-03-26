library(VGAM)


### Name: Zigeom
### Title: Zero-Inflated Geometric Distribution
### Aliases: Zigeom dzigeom pzigeom qzigeom rzigeom
### Keywords: distribution

### ** Examples

prob <- 0.5; pstr0 <- 0.2; x <- (-1):20
(ii <- dzigeom(x, prob, pstr0))
max(abs(cumsum(ii) - pzigeom(x, prob, pstr0)))  # Should be 0
table(rzigeom(1000, prob, pstr0))

## Not run: 
##D  x <- 0:10
##D barplot(rbind(dzigeom(x, prob, pstr0), dgeom(x, prob)),
##D         beside = TRUE, col = c("blue","orange"),
##D         ylab = "P[Y = y]", xlab = "y", las = 1,
##D         main = paste("zigeometric(", prob, ", pstr0 = ", pstr0,
##D                      ") (blue) vs",
##D                      " geometric(", prob, ") (orange)", sep = ""),
##D         names.arg = as.character(x)) 
## End(Not run)



