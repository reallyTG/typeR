library(semTools)


### Name: lavTestWald.mi
### Title: Wald Test for Multiple Imputations
### Aliases: lavTestWald.mi

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
##D fit <- cfa.mi(HS.model, data = imps)
##D 
##D ## Testing whether a single parameter equals zero yields the 'chi-square'
##D ## version of the Wald z statistic from the summary() output, or the
##D ## 'F' version of the t statistic from the summary() output, depending
##D ## whether asymptotic = TRUE or FALSE
##D lavTestWald.mi(fit, constraints = "b1 == 0")      # default D1 statistic
##D lavTestWald.mi(fit, constraints = "b1 == 0", test = "D2") # D2 statistic
##D 
##D ## The real advantage is simultaneously testing several equality
##D ## constraints, or testing more complex constraints:
##D con <- '
##D    2*b1 == b3
##D    b2 - b3 == 0
##D '
##D lavTestWald.mi(fit, constraints = con) # default F statistic
##D lavTestWald.mi(fit, constraints = con, asymptotic = TRUE) # chi-squared
##D 
## End(Not run)




