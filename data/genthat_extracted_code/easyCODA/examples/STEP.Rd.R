library(easyCODA)


### Name: STEP
### Title: Stepwise selection of logratios
### Aliases: STEP
### Keywords: multivariate

### ** Examples

# Stepwise selection of ratios for RomanCups data set
data(cups)
# Set seed to obtain same results as in Appendix C of Greenacre (2018)
set.seed(2872)
STEP(cups, random=TRUE)
# Select best ratio, but output "top 5"
STEP(cups, nsteps=1, top=5)



