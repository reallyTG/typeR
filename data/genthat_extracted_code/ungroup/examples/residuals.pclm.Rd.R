library(ungroup)


### Name: residuals.pclm
### Title: Extract PCLM Deviance Residuals
### Aliases: residuals.pclm

### ** Examples

x <- c(0, 1, seq(5, 85, by = 5))
y <- c(294, 66, 32, 44, 170, 284, 287, 293, 361, 600, 998, 
       1572, 2529, 4637, 6161, 7369, 10481, 15293, 39016)
M1 <- pclm(x, y, nlast = 26)

residuals(M1)



