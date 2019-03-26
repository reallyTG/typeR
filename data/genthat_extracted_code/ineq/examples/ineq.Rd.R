library(ineq)


### Name: ineq
### Title: Inequality Measures
### Aliases: ineq Gini RS Atkinson Theil Kolm var.coeff entropy
### Keywords: univar

### ** Examples

# generate vector (of incomes)
x <- c(541, 1463, 2445, 3438, 4437, 5401, 6392, 8304, 11904, 22261)
# compute Gini coefficient
ineq(x)
# compute Atkinson coefficient with parameter=0.5
ineq(x, parameter=0.5, type="Atkinson")



