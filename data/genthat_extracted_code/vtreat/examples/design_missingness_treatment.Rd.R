library(vtreat)


### Name: design_missingness_treatment
### Title: Design a simple treatment plan to indicate missingingness and
###   perform simple imputation.
### Aliases: design_missingness_treatment

### ** Examples


d <- wrapr::build_frame(
  "x1", "x2", "x3" |
  1   , 4   , "A"  |
  NA  , 5   , "B"  |
  3   , 6   , NA   )

plan <- design_missingness_treatment(d)
prepare(plan, d)

prepare(plan, data.frame(x1=NA, x2=NA, x3="E"))




