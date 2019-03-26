library(VGAM)


### Name: Oilog
### Title: One-Inflated Logarithmic Distribution
### Aliases: Oilog doilog poilog qoilog roilog
### Keywords: distribution

### ** Examples

shape <- 0.5; pstr1 <- 0.3; x <- (-1):7
(ii <- doilog(x, shape, pstr1 = pstr1))
max(abs(poilog(1:200, shape) -
        cumsum(shape^(1:200) / (-(1:200) * log1p(-shape)))))  # Should be 0

## Not run: 
##D  x <- 0:10
##D par(mfrow = c(2, 1))  # One-Inflated logarithmic
##D barplot(rbind(doilog(x, shape, pstr1 = pstr1), dlog(x, shape)),
##D         beside = TRUE, col = c("blue", "orange"),
##D         main = paste("OILogff(", shape, ", pstr1 = ", pstr1, ") (blue) vs",
##D                      " Logff(", shape, ") (orange)", sep = ""),
##D         names.arg = as.character(x))
##D 
##D deflat.limit <- -dlog(1, shape) / plog(1, shape, lower.tail = FALSE)
##D newpstr1 <- round(deflat.limit, 3) + 0.001  # Inside but near the boundary
##D barplot(rbind(doilog(x, shape, pstr1 = newpstr1),
##D                 dlog(x, shape)),
##D         beside = TRUE, col = c("blue","orange"),
##D         main = paste("ODLogff(", shape, ", pstr1 = ", newpstr1, ") (blue) vs",
##D                      " Logff(", shape, ") (orange)", sep = ""),
##D         names.arg = as.character(x)) 
## End(Not run)



