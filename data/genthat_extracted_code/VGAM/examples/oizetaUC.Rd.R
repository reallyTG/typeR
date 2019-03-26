library(VGAM)


### Name: Oizeta
### Title: One-Inflated Zeta Distribution
### Aliases: Oizeta doizeta poizeta qoizeta roizeta
### Keywords: distribution

### ** Examples

shape <- 1.5; pstr1 <- 0.3; x <- (-1):7
(ii <- doizeta(x, shape, pstr1 = pstr1))
max(abs(poizeta(1:200, shape) -
        cumsum(1/(1:200)^(1+shape)) / zeta(shape+1)))  # Should be 0

## Not run: 
##D  x <- 0:10
##D par(mfrow = c(2, 1))  # One-Inflated zeta
##D barplot(rbind(doizeta(x, shape, pstr1 = pstr1), dzeta(x, shape)),
##D         beside = TRUE, col = c("blue", "orange"),
##D         main = paste("OIZeta(", shape, ", pstr1 = ", pstr1, ") (blue) vs",
##D                      " Zeta(", shape, ") (orange)", sep = ""),
##D         names.arg = as.character(x))
##D 
##D deflat.limit <- -dzeta(1, shape) / pzeta(1, shape, lower.tail = FALSE)
##D newpstr1 <- round(deflat.limit, 3) + 0.001  # Inside but near the boundary
##D barplot(rbind(doizeta(x, shape, pstr1 = newpstr1),
##D                 dzeta(x, shape)),
##D         beside = TRUE, col = c("blue","orange"),
##D         main = paste("ODZeta(", shape, ", pstr1 = ", newpstr1, ") (blue) vs",
##D                      " Zeta(", shape, ") (orange)", sep = ""),
##D         names.arg = as.character(x)) 
## End(Not run)



