library(VGAM)


### Name: Oizipf
### Title: One-Inflated Zipf Distribution
### Aliases: Oizipf doizipf poizipf qoizipf roizipf
### Keywords: distribution

### ** Examples

N <- 10; shape <- 1.5; pstr1 <- 0.3; x <- (-1):N
(ii <- doizipf(x, N, shape, pstr1 = pstr1))

## Not run: 
##D  x <- 0:10
##D par(mfrow = c(2, 1))  # One-Inflated zipf
##D barplot(rbind(doizipf(x, N, shape, pstr1 = pstr1), dzipf(x, N, shape)),
##D         beside = TRUE, col = c("blue", "orange"),
##D         main = paste("OIZipf(", N, ", ", shape, ", pstr1 = ", pstr1, ") (blue) vs",
##D                      " Zipf(", N, ", ", shape, ") (orange)", sep = ""),
##D         names.arg = as.character(x))
##D 
##D deflat.limit <- -dzipf(1, N, shape) / (1 - dzipf(1, N, shape))
##D newpstr1 <- round(deflat.limit, 3) + 0.001  # Inside but near the boundary
##D barplot(rbind(doizipf(x, N, shape, pstr1 = newpstr1),
##D                 dzipf(x, N, shape)),
##D         beside = TRUE, col = c("blue", "orange"),
##D         main = paste("ODZipf(", N, ", ", shape, ", pstr1 = ", newpstr1, ") (blue) vs",
##D                      " Zipf(", N, ", ", shape, ") (orange)", sep = ""),
##D         names.arg = as.character(x)) 
## End(Not run)



