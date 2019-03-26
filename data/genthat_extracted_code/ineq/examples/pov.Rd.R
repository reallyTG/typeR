library(ineq)


### Name: pov
### Title: Poverty Measures
### Aliases: pov Watts Sen SST Foster
### Keywords: univar

### ** Examples

# generate vectors (of incomes)
x <- c(541, 1463, 2445, 3438, 4437, 5401, 6392, 8304, 11904, 22261)
y <- c(841, 2063, 2445, 3438, 4437, 5401, 6392, 8304, 11304, 21961)
# compute Watts index with poverty line 2000
pov(x, 2000)
pov(y, 2000)
# compute headcount ratio with poverty line 2000
pov(x, 2000, parameter=1, type="Foster")
pov(y, 2000, parameter=1, type="Foster")


