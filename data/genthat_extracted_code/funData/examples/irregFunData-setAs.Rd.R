library(funData)


### Name: irregFunData-setAs
### Title: Coerce an irregFunData object to class funData
### Aliases: irregFunData-setAs
### Keywords: internal

### ** Examples

# create irregFunData object with 2 observations
i1 <- irregFunData(argvals = list(1:5, 3:6), X = list(2:6, 4:7))
i1@argvals # argvals and X are both lists with 2 entries
i1@X

# coerce to funData object (with missing values)
f1 <- as.funData(i1)
# argvals is a list containing one vector
# (one-dimensional domain, union of all observation points)
f1@argvals
# X is a matrix with 2 rows and missing values
f1@X



