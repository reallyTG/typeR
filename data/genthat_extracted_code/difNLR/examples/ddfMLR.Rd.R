library(difNLR)


### Name: ddfMLR
### Title: Performs DDF detection using Multinomial Log-linear Regression
###   model.
### Aliases: ddfMLR print.ddfMLR plot.ddfMR print.ddfMLR plot.ddfMLR
###   coef.ddfMLR logLik.ddfMLR AIC.ddfMLR BIC.ddfMLR
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
##D (x <- ddfMLR(Data, group, focal.name = 1, key))
##D 
##D # Testing both DDF effects with Benjamini-Hochberg adjustment method
##D ddfMLR(Data, group, focal.name = 1, key, p.adjust.method = "BH")
##D 
##D # Testing both DDF effects with item purification
##D ddfMLR(Data, group, focal.name = 1, key, purify = T)
##D 
##D # Testing uniform DDF effects
##D ddfMLR(Data, group, focal.name = 1, key, type = "udif")
##D # Testing non-uniform DDF effects
##D ddfMLR(Data, group, focal.name = 1, key, type = "nudif")
##D 
##D # Testing both DDF effects with total score as matching criterion
##D ddfMLR(Data, group, focal.name = 1, key, match = "score")
##D 
##D # Graphical devices
##D plot(x, item = 1)
##D plot(x, item = x$DDFitems)
##D plot(x, item = "all")
##D 
##D # AIC, BIC, logLik
##D AIC(x)
##D BIC(x)
##D logLik(x)
## End(Not run)



