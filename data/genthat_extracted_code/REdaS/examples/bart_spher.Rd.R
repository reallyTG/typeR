library(REdaS)


### Name: Bartlett-Sphericity
### Title: Bartlett's Test of Sphericity
### Aliases: bart_spher print.bart_spher

### ** Examples

# generate a data frame with 3 variables and 100 observations
set.seed(5L)
datamatrix <- data.frame("A" = rnorm(100), "B" = rnorm(100), "C" = rnorm(100))
head(datamatrix)

# correlation matrix
cor(datamatrix)


# bartlett's test
bart_spher(datamatrix)


# effects of missing observations on correlations: to illustrate this, the first
# observation on variable A is set to NA
datamatrix[1, 1] <- NA
head(datamatrix)

# "everything" (the default) causes all correlations involving a variable with
# missing values to be NA (in this case, all pairwise correlations with the
# variable "A")
cor(datamatrix)

# "all.obs" generates an error if missing values are present.
## Not run: 
##D cor(datamatrix, use = "all.obs")
## End(Not run)

# "complete.obs" and "na.or.complete" delete complete observations if there are
# NA (in this case, the first case would be deleted). If there are no complete
# cases left after the listwise deletion, "complete.obs" results in an error
# while "na.or.complete" returns a matrix with all elements being NA.
cor(datamatrix, use = "complete.obs")
cor(datamatrix, use = "na.or.complete")

# "pairwise.complete.obs" uses all non-missing pairwise values. If there are no
# non-missing value pairs in two variables, the results will be NA.
# It is possible that correlation matrices are not positive semi-definite.
cor(datamatrix, use = "pairwise.complete.obs")


# with the missing value in the first cell, the test does not work anymore:
## Not run: 
##D bart_spher(datamatrix)
## End(Not run)

# deleting the whole first observation (listwise) gives
bart_spher(datamatrix, use = "na.or.complete")

# using pairwise-correlation, the result is
bart_spher(datamatrix, use = "pairwise.complete.obs")



