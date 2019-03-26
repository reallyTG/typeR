library(Hmisc)


### Name: ciapower
### Title: Power of Interaction Test for Exponential Survival
### Aliases: ciapower
### Keywords: survival htest

### ** Examples

# Find the power of a race x treatment test.  25% of patients will
# be non-white and the total sample size is 14000.  
# Accrual is for 1.5 years and minimum follow-up is 5y.
# Reduction in 5-year mortality is 15% for whites, 0% or -5% for
# non-whites.  5-year mortality for control subjects if assumed to
# be 0.18 for whites, 0.23 for non-whites.
n <- 14000
for(nonwhite.reduction in c(0,-5)) {
  cat("\n\n\n% Reduction in 5-year mortality for non-whites:",
      nonwhite.reduction, "\n\n")
  pow <- ciapower(5,  .75*n, .25*n,  .18, .23,  15, nonwhite.reduction,  
                  1.5, 5)
  cat("\n\nPower:",format(pow),"\n")
}



