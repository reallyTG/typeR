library(mirt)


### Name: mod2values
### Title: Convert an estimated mirt model to a data.frame
### Aliases: mod2values
### Keywords: convert model

### ** Examples

## Not run: 
##D dat <- expand.table(LSAT7)
##D mod <- mirt(dat, 1)
##D values <- mod2values(mod)
##D values
##D 
##D #use the converted values as starting values in a new model, and reduce TOL
##D mod2 <- mirt(dat, 1, pars = values, TOL=1e-5)
##D 
## End(Not run)



