library(PPCI)


### Name: ncuth
### Title: Minimum Normalised Cut Hyperplane
### Aliases: ncuth
### Keywords: file

### ** Examples

## load breast cancer dataset
data(breastcancer)

## find minimum normalised cut hyperplane
sol <- ncuth(breastcancer$x)

## visualise the solution
plot(sol)

## evaluate the performance of the solution
success_ratio(sol$cluster, breastcancer$c)



