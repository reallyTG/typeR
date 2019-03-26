library(VGAM)


### Name: chest.nz
### Title: Chest Pain in NZ Adults Data
### Aliases: chest.nz
### Keywords: datasets

### ** Examples

## Not run: 
##D fit <- vgam(cbind(nolnor, nolr, lnor, lr) ~ s(age, c(4, 3)),
##D             binom2.or(exchan = TRUE, zero = NULL), data = chest.nz)
##D coef(fit, matrix = TRUE)
## End(Not run)
## Not run:  plot(fit, which.cf = 2, se = TRUE) 



