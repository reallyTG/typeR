library(semTools)


### Name: lavTestLRT.mi
### Title: Likelihood Ratio Test for Multiple Imputations
### Aliases: lavTestLRT.mi

### ** Examples

 ## Not run: 
##D ## impose missing data for example
##D HSMiss <- HolzingerSwineford1939[ , c(paste("x", 1:9, sep = ""),
##D                                       "ageyr","agemo","school")]
##D set.seed(12345)
##D HSMiss$x5 <- ifelse(HSMiss$x5 <= quantile(HSMiss$x5, .3), NA, HSMiss$x5)
##D age <- HSMiss$ageyr + HSMiss$agemo/12
##D HSMiss$x9 <- ifelse(age <= quantile(age, .3), NA, HSMiss$x9)
##D 
##D ## impute missing data
##D library(Amelia)
##D set.seed(12345)
##D HS.amelia <- amelia(HSMiss, m = 20, noms = "school", p2s = FALSE)
##D imps <- HS.amelia$imputations
##D 
##D ## specify CFA model from lavaan's ?cfa help page
##D HS.model <- '
##D   visual  =~ x1 + b1*x2 + x3
##D   textual =~ x4 + b2*x5 + x6
##D   speed   =~ x7 + b3*x8 + x9
##D '
##D 
##D fit1 <- cfa.mi(HS.model, data = imps, estimator = "mlm")
##D fit0 <- cfa.mi(HS.model, data = imps, estimator = "mlm", orthogonal = TRUE)
##D 
##D ## By default, use D3.
##D ## Must request a chi-squared statistic to be robustified.
##D lavTestLRT.mi(fit1, h1 = fit0, asymptotic = TRUE)
##D 
##D ## Using D2, you can either robustify the pooled naive statistic ...
##D lavTestLRT.mi(fit1, h1 = fit0, asymptotic = TRUE, test = "D2")
##D ## ... or pool the robust chi-squared statistic
##D lavTestLRT.mi(fit1, h1 = fit0, asymptotic = TRUE, test = "D2",
##D               pool.robust = TRUE)
## End(Not run)




