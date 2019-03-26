library(difNLR)


### Name: MLR
### Title: DDF likelihood ratio statistics based on Multinomial Log-linear
###   Regression model.
### Aliases: MLR
### Keywords: DDF

### ** Examples

## Not run: 
##D # loading data based on GMAT
##D data(GMATtest, GMATkey)
##D 
##D Data  <- GMATtest[, 1:20]
##D group <- GMATtest[, "group"]
##D key <- GMATkey
##D 
##D # Testing both DDF effects
##D MLR(Data, group, key, type = "both")
##D 
##D # Testing uniform DDF effects
##D MLR(Data, group, key, type = "udif")
##D 
##D # Testing non-uniform DDF effects
##D MLR(Data, group, key, type = "nudif")
## End(Not run)



