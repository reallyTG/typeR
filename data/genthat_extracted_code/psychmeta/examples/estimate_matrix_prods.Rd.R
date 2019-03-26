library(psychmeta)


### Name: estimate_matrix_prods
### Title: Estimate covariance matrices and mean vectors containing product
###   terms
### Aliases: estimate_matrix_prods
### Keywords: internal

### ** Examples

## Establish mean and covariance parameters
mu_vec <- 1:4
sigma_mat <- reshape_vec2mat(c(.1, .2, .3, .4, .5, .6), var_names = LETTERS[1:4])
names(mu_vec) <- colnames(sigma_mat)

## Define a list of variables to be used in estimating products:
prod_list <- list(c("A", "B"),
                  c("A", "C"),
                  c("A", "D"),
                  c("B", "C"),
                  c("B", "D"),
                  c("C", "D"))

## Generate data for the purposes of comparison:
set.seed(1)
dat <- data.frame(MASS::mvrnorm(100000, mu = mu_vec, Sigma = sigma_mat, empirical = TRUE))

## Create product terms in simulated data:
for(i in 1:length(prod_list))
     dat[,paste(prod_list[[i]], collapse = "_x_")] <-
     dat[,prod_list[[i]][1]] * dat[,prod_list[[i]][2]]

## Analytically estimate product variables and compare to simulated data:
estimate_matrix_prods(sigma_mat = sigma_mat, mu_vec = mu_vec, prod_list = prod_list)
round(cov(dat), 2)
round(apply(dat, 2, mean), 2)



