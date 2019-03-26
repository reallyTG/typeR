library(DescTools)


### Name: Gini
### Title: Gini Coefficient
### Aliases: Gini
### Keywords: univar

### ** Examples

# generate vector (of incomes)
x <- c(541, 1463, 2445, 3438, 4437, 5401, 6392, 8304, 11904, 22261)

# compute Gini coefficient
Gini(x)

# working with weights
fl <- c(2.5, 7.5, 15, 35, 75, 150)    # midpoints of classes
n  <- c(25, 13, 10, 5, 5, 2)          # frequencies

# with confidence intervals
Gini(fl, n, conf.level=0.95, unbiased=FALSE)

# some special cases
x <- c(10, 10, 0, 0, 0)
plot(Lc(x))

Gini(x, unbiased=FALSE)

# the same with weights
Gini(x=c(10, 0), n=c(2,3), unbiased=FALSE)

# perfect balance
Gini(c(10, 10, 10))



