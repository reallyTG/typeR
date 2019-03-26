library(metamisc)


### Name: metapred
### Title: Generalized Stepwise Regression for prediction models
### Aliases: metapred

### ** Examples

data(DVTipd)
DVTipd$cluster <- 1:4 # Add a fictional clustering to the data set.
metamisc:::metapred(DVTipd, strata = "cluster", f = dvt ~ sex + vein + malign, family = binomial)

## Not run: 
##D # Some additional examples:
##D metamisc:::metapred(DVTipd, strata = "cluster", f = dvt ~ sex + vein + malign
##D , family = binomial, stepwise = FALSE)
##D metamisc:::metapred(DVTipd, strata = "cluster", f = dvt ~ sex + altdiagn + histdvt
##D , family = binomial, recal.int = TRUE)
##D metamisc:::metapred(DVTipd, strata = "cluster", f = dvt ~ sex + altdiagn + histdvt
##D , family = binomial, meta.method = "DL")
## End(Not run)
# By default, metapred assumes the first column is the outcome.
DVTipd.reordered <- DVTipd[c("dvt", "ddimdich", "histdvt", "cluster")]
mp <- metamisc:::metapred(DVTipd.reordered, strata = "cluster", family = binomial)
fitted <- predict(mp, newdata = DVTipd.reordered)





