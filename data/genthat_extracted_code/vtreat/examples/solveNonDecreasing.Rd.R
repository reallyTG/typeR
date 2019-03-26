library(vtreat)


### Name: solveNonDecreasing
### Title: Solve for best non-decreasing fit using isotone regression (from
###   the "isotone" package <URL:
###   https://CRAN.R-project.org/package=isotone>).
### Aliases: solveNonDecreasing

### ** Examples


if(requireNamespace("isotone", quietly = TRUE)) {
   solveNonDecreasing('v', 1:3, c(1,2,1))
}




