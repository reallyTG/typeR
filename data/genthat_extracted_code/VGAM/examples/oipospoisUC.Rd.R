library(VGAM)


### Name: Oipospois
### Title: One-Inflated Positive Poisson Distribution
### Aliases: Oipospois doipospois poipospois qoipospois roipospois
### Keywords: distribution

### ** Examples

lambda <- 3; pstr1 <- 0.2; x <- (-1):7
(ii <- doipospois(x, lambda, pstr1 = pstr1))
table(roipospois(100, lambda, pstr1 = pstr1))
round(doipospois(1:10, lambda, pstr1 = pstr1) * 100)  # Should be similar

## Not run: 
##D  x <- 0:10
##D par(mfrow = c(2, 1))  # One-Inflated Positive Poisson
##D barplot(rbind(doipospois(x, lambda, pstr1 = pstr1), dpospois(x, lambda)),
##D         beside = TRUE, col = c("blue", "orange"),
##D         main = paste("OIPP(", lambda, ", pstr1 = ", pstr1, ") (blue) vs",
##D                      " PosPoisson(", lambda, ") (orange)", sep = ""),
##D         names.arg = as.character(x))
##D 
##D deflat.limit <- -lambda / (expm1(lambda) - lambda)  # 0-deflated Pos Poisson
##D newpstr1 <- round(deflat.limit, 3) + 0.001  # Inside and near the boundary
##D barplot(rbind(doipospois(x, lambda, pstr1 = newpstr1),
##D                 dpospois(x, lambda)),
##D         beside = TRUE, col = c("blue","orange"),
##D         main = paste("ODPP(", lambda, ", pstr1 = ", newpstr1, ") (blue) vs",
##D                      " PosPoisson(", lambda, ") (orange)", sep = ""),
##D         names.arg = as.character(x)) 
## End(Not run)



