library(UncertainInterval)


### Name: check.data
### Title: Function to check the dataset of individuals with (1) and
###   without (0) the targeted condition.
### Aliases: check.data

### ** Examples

#' set.seed(1)
ref=c(rep(0,500), rep(1,500))
test=c(rnorm(500,0,1), rnorm(500,1,1.2))
check.data(ref, test) # model = 'kernel'



