library(synthpop)


### Name: syn.satcat
### Title: Synthesis from a saturated model based on all combinations of
###   the predictor variables.
### Aliases: syn.satcat
### Keywords: datagen

### ** Examples

ods <- SD2011[, c("region", "sex", "agegr", "placesize")]

s1 <- syn(ods, method = c("sample", "cart", "satcat", "cart"))

### mostly fails because too many small categories
s2 <- syn(ods, method = c("sample", "cart", "cart", "satcat"))  



