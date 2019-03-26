library(funData)


### Name: as.data.frame.funData
### Title: Coerce functional data objects to a data.frame
### Aliases: as.data.frame.funData as.data.frame,funData-method
###   as.data.frame,multiFunData-method as.data.frame,irregFunData-method

### ** Examples

# one-dimensional domain
f1 <- funData(argvals = 1:5, X = matrix(1:20, nrow = 4))
head(as.data.frame(f1))

# two-dimensional domain
f2 <- funData(argvals = list(1:5, 1:6), X = array(1:120, c(4,5,6)))
head(as.data.frame(f2))

# multivariate functional data
m1 <- multiFunData(f1, f2)
str(as.data.frame(m1))

# irregular functional data
i1 <- irregFunData(argvals = list(1:5, 2:4, 3:5), X = list(1:5, 2:4, -(3:1)))
head(as.data.frame(i1))



