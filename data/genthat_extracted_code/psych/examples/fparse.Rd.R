library(psych)


### Name: fparse
### Title: Parse and exten formula input from a model and return the DV,
###   IV, and associated terms.
### Aliases: fparse
### Keywords: utilities

### ** Examples

fparse(DV  ~ IV1 + IV2 * IV2*IV3 + (IV4) + I(IV5^2) )
#somewhat more complicated
fparse(DV1 + DV2 ~ IV1 + IV2 + IV3*IV4 + I(IV5^2) + I(Iv6^2) + (IV7) + (IV8) - IV9)




