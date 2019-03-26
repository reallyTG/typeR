library(VGAM)


### Name: Oiposbinom
### Title: One-Inflated Positive Binomial Distribution
### Aliases: Oiposbinom doiposbinom poiposbinom qoiposbinom roiposbinom
### Keywords: distribution

### ** Examples

size <- 10; prob <- 0.2; pstr1 <- 0.4; x <- (-1):size
(ii <- doiposbinom(x, size, prob, pstr1 = pstr1))
table(roiposbinom(100, size, prob, pstr1 = pstr1))
round(doiposbinom(x  , size, prob, pstr1 = pstr1) * 100)  # Should be similar

## Not run: 
##D  x <- 0:size
##D par(mfrow = c(2, 1))  # One-Inflated Positive Binomial
##D barplot(rbind(doiposbinom(x, size, prob, pstr1 = pstr1),
##D               dposbinom(x, size, prob)),
##D         beside = TRUE, col = c("blue", "orange"),
##D         main = paste("OIPB(", size, ",", prob, ", pstr1 = ", pstr1, ") (blue) vs",
##D                      " PosBinomial(", size, ",", prob, ") (orange)", sep = ""),
##D         names.arg = as.character(x))
##D 
##D # Zero-deflated Pos Binomial
##D deflat.limit <- -dposbinom(1, size, prob) / (1 - dposbinom(1, size, prob))
##D deflat.limit <- size * prob / (1 + (size-1) * prob - 1 / (1-prob)^(size-1))
##D newpstr1 <- round(deflat.limit, 3) + 0.001  # A little from the boundary
##D barplot(rbind(doiposbinom(x, size, prob, pstr1 = newpstr1),
##D                 dposbinom(x, size, prob)),
##D         beside = TRUE, col = c("blue","orange"),
##D         main = paste("ODPB(", size, ",", prob, ", pstr1 = ", newpstr1, ") (blue) vs",
##D                      " PosBinomial(", size, ",", prob, ") (orange)", sep = ""),
##D         names.arg = as.character(x)) 
## End(Not run)



