library(PPCI)


### Name: mdh
### Title: Minimum Density Hyperplane
### Aliases: mdh
### Keywords: file

### ** Examples

## load breast cancer dataset
data(breastcancer)

## find minimum density hyperplane
sol <- mdh(breastcancer$x)

## visualise the solution
plot(sol)

## evaluate the quality of the partition
success_ratio(sol$cluster, breastcancer$c)



