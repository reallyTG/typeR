library(enviPat)


### Name: adducts
### Title: Adduct list
### Aliases: adducts
### Keywords: datasets

### ** Examples

# example of M+H adduct batch calculation
data(adducts)
data(isotopes)
data(chemforms)
# (1) check formulas for consistency - recommended
checked_chemforms <-	check_chemform(isotopes, chemforms)			 
# (2) multiply, see column 4 of adducts
chemforms <-multiform(checked_chemforms[,2],1)			 
# (3) add adduct - see column 7 of adducts
chemforms<-mergeform(chemforms,"H1")
# (4) calculate fine structure
patterns <- isopattern(isotopes, chemforms)



