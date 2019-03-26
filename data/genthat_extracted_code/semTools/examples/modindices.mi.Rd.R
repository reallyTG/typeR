library(semTools)


### Name: modindices.mi
### Title: Modification Indices for Multiple Imputations
### Aliases: modindices.mi modificationIndices.mi modificationindices.mi

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
##D   visual  =~ x1 + x2 + x3
##D   textual =~ x4 + x5 + x6
##D   speed   =~ x7 + x8 + x9
##D '
##D 
##D out <- cfa.mi(HS.model, data = imps)
##D 
##D modindices.mi(out) # default: Li et al.'s (1991) "D2" method
##D modindices.mi(out, type = "Rubin") # Rubin's rules
##D 
## End(Not run)




