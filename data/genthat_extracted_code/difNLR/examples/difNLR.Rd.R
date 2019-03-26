library(difNLR)


### Name: difNLR
### Title: Performs DIF detection using Non-Linear Regression method.
### Aliases: difNLR print.difNLR print.difNLR fitted.difNLR coef.difNLR
###   logLik.difNLR AIC.difNLR BIC.difNLR residuals.difNLR resid.difNLR
### Keywords: DIF

### ** Examples

## Not run: 
##D # loading data based on GMAT
##D data(GMAT)
##D 
##D Data  <- GMAT[, 1:20]
##D group <- GMAT[, "group"]
##D 
##D # Testing both DIF effects using likelihood-ratio test and
##D # 3PL model with fixed guessing for groups
##D (x <- difNLR(Data, group, focal.name = 1, model = "3PLcg"))
##D 
##D # Testing both DIF effects using F test and
##D # 3PL model with fixed guessing for groups
##D difNLR(Data, group, focal.name = 1, model = "3PLcg", test = "F")
##D 
##D # Testing both DIF effects using LR test,
##D # 3PL model with fixed guessing for groups
##D # and Benjamini-Hochberg correction
##D difNLR(Data, group, focal.name = 1, model = "3PLcg", p.adjust.method = "BH")
##D 
##D # Testing both DIF effects using LR test,
##D # 3PL model with fixed guessing for groups
##D # and item purification
##D difNLR(Data, group, focal.name = 1, model = "3PLcg", purify = T)
##D 
##D # Testing both DIF effects using 3PL model with fixed guessing for groups
##D # and total score as matching criterion
##D difNLR(Data, group, focal.name = 1, model = "3PLcg", match = "score")
##D 
##D # Testing uniform DIF effects using 4PL model with the same
##D # guessing and inattention
##D difNLR(Data, group, focal.name = 1, model = "4PLcgdg", type = "udif")
##D 
##D # Testing non-uniform DIF effects using 2PL model
##D difNLR(Data, group, focal.name = 1, model = "2PL", type = "nudif")
##D 
##D # Testing difference in parameter b using 4PL model with fixed
##D # a and c parameters
##D difNLR(Data, group, focal.name = 1, model = "4PL", constraints = "ac", type = "b")
##D 
##D # Testing both DIF effects using LR test,
##D # 3PL model with fixed guessing for groups
##D # with maximum likelihood estimation method
##D difNLR(Data, group, focal.name = 1, model = "3PLcg", method = "likelihood")
##D 
##D # Graphical devices
##D plot(x)
##D plot(x, item = x$DIFitems)
##D plot(x, plot.type = "stat")
##D 
##D # Coefficients
##D coef(x)
##D 
##D # Fitted values
##D fitted(x)
##D fitted(x, item = 1)
##D 
##D # Residuals
##D residuals(x)
##D residuals(x, item = 1)
##D 
##D # Predicted values
##D predict(x)
##D predict(x, item = 1)
##D 
##D # Predicted values for new subjects
##D predict(x, item = 1, match = 0, group = 1)
##D predict(x, item = 1, match = 0, group = 0)
##D 
##D # AIC, BIC, logLik
##D AIC(x); AIC(x, item = 1)
##D BIC(x); BIC(x, item = 1)
##D logLik(x); logLik(x, item = 1)
## End(Not run)




