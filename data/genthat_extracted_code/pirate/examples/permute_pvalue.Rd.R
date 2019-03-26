library(pirate)


### Name: permute_pvalue
### Title: Calculation of permutation p-value
### Aliases: permute_pvalue

### ** Examples

#constructing the covariance matrix
co <- matrix(0.2, 10, 10)
diag(co) <- 1
#simulate a data set
dataEx <- data_generator1(d = 0.3, R2 = 0.5, v2 = 1, n = 300,
                        co = co, beta1 = rep(1,10),inter = c(0,0))
#calculate the permuted p value
dat <- dataEx[[1]]
permute_pvalue(dat, permuteN = 200, method = "nu")



