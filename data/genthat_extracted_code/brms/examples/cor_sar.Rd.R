library(brms)


### Name: cor_sar
### Title: Spatial simultaneous autoregressive (SAR) structures
### Aliases: cor_sar cor_lagsar cor_errorsar

### ** Examples

## Not run: 
##D data(oldcol, package = "spdep")
##D fit1 <- brm(CRIME ~ INC + HOVAL, data = COL.OLD, 
##D             autocor = cor_lagsar(COL.nb), 
##D             chains = 2, cores = 2)
##D summary(fit1)
##D plot(fit1)
##D 
##D fit2 <- brm(CRIME ~ INC + HOVAL, data = COL.OLD, 
##D             autocor = cor_errorsar(COL.nb), 
##D             chains = 2, cores = 2)
##D summary(fit2)
##D plot(fit2)
## End(Not run)




