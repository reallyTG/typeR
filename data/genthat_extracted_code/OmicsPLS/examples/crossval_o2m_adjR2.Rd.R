library(OmicsPLS)


### Name: crossval_o2m_adjR2
### Title: Adjusted Cross-validate procedure for O2PLS
### Aliases: crossval_o2m_adjR2

### ** Examples

local({
X = scale(jitter(tcrossprod(rnorm(100),runif(10))))
Y = scale(jitter(tcrossprod(rnorm(100),runif(10))))
crossval_o2m_adjR2(X, Y, a = 1:4, ax = 1:2, ay = 1:2, 
             nr_folds = 5, nr_cores = 1)
})



