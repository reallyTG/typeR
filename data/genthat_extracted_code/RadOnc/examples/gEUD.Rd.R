library(RadOnc)


### Name: gEUD
### Title: Generalized Equivalent Uniform Dose (gEUD) Calculation
### Aliases: gEUD gEUD-methods gEUD,ANY,missing-method
###   gEUD,DVH.list,numeric-method gEUD,DVH,numeric-method
### Keywords: methods manip

### ** Examples

data("RadOnc")
gEUD(janedoe, 1) == unlist(janedoe$"Dmean")
gEUD(janedoe, Inf) == unlist(janedoe$"Dmax")
gEUD(janedoe, -Inf) == unlist(janedoe$"Dmin")



