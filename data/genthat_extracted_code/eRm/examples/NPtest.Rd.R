library(eRm)


### Encoding: UTF-8

### Name: NonparametricTests
### Title: A Function to Perform Nonparametric Rasch Model Tests
### Aliases: NonparametricTests NPtest
### Keywords: htest nonparametric

### ** Examples

### Preparation:

# data for examples below
X <- raschdat1

# generate 100 random matrices based on original data matrix
rmat <- rsampler(X, rsctrl(burn_in = 100, n_eff = 100, seed = 123))

## the following examples can also directly be used by setting
## rmat <- raschdat1
## without calling rsampler() first, e.g.,
t1 <- NPtest(raschdat1, n = 100, method = "T1")


### Examples ###################################################################

###--- T1 ----------------------------------------------------------------------
t1 <- NPtest(rmat, method = "T1")
# choose a different alpha for selecting displayed values
print(t1, alpha = 0.01)


###--- T2 ----------------------------------------------------------------------
t21 <- NPtest(rmat, method = "T2", idx = 1:5, burn_in = 100, step = 20,
              seed = 7654321, RSinfo = TRUE)
# default stat is variance
t21

t22 <- NPtest(rmat, method = "T2", stat = "mad1",
              idx = c(1, 22, 5, 27, 6, 9, 11))
t22


###--- T4 ----------------------------------------------------------------------
age <- sample(20:90, 100, replace = TRUE)
# group MUST be a logical vector
# (value of TRUE is used for group selection)
age <- age < 30
t41 <- NPtest(rmat, method = "T4", idx = 1:3, group = age)
t41

sex <- gl(2, 50)
# group can also be a logical expression (generating a vector)
t42 <- NPtest(rmat, method = "T4", idx = c(1, 4, 5, 6), group = sex == 1)
t42


###--- T10 ---------------------------------------------------------------------
t101 <- NPtest(rmat, method = "T10")       # default split criterion is "median"
t101

## Not run: 
##D split <- runif(100)
##D t102 <- NPtest(rmat, method = "T10", splitcr = split > 0.5)
##D t102
##D 
##D t103 <- NPtest(rmat, method = "T10", splitcr = sex)
##D t103
## End(Not run)


###--- T11 ---------------------------------------------------------------------
t11 <- NPtest(rmat, method = "T11")
t11


###--- Tpbis -------------------------------------------------------------------
tpb <- NPtest(X[, 1:5], method = "Tpbis", idxt = 1, idxs = 2:5)
tpb


###--- Martin-Löf --------------------------------------------------------------
## Not run: 
##D # takes a while ...
##D split <- rep(1:3, each = 10)
##D NPtest(raschdat1, n = 100, method = "MLoef", splitcr = split)
## End(Not run)



