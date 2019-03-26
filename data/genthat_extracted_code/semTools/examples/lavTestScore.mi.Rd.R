library(semTools)


### Name: lavTestScore.mi
### Title: Score Test for Multiple Imputations
### Aliases: lavTestScore.mi

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
##D   speed =~ c(L1, L1)*x7 + c(L1, L1)*x8 + c(L1, L1)*x9
##D '
##D 
##D out <- cfa.mi(HS.model, data = imps, group = "school", std.lv = TRUE)
##D 
##D ## Mode 1: Score test for releasing equality constraints
##D 
##D ## default test: Li et al.'s (1991) "D2" method
##D lavTestScore.mi(out, cumulative = TRUE)
##D ## Rubin's rules
##D lavTestScore.mi(out, test = "Rubin")
##D 
##D ## Mode 2: Score test for adding currently fixed-to-zero parameters
##D lavTestScore.mi(out, add = 'x7 ~~ x8 + x9')
##D 
## End(Not run)




