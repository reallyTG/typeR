library(Ball)


### Name: bcorsis
### Title: Ball Correlation Sure Independence Screening
### Aliases: bcorsis

### ** Examples

## Not run: 
##D 
##D ############### Quick Start for bcorsis function ###############
##D set.seed(1)
##D n <- 150
##D p <- 3000
##D x <- matrix(rnorm(n * p), nrow = n)
##D error <- rnorm(n)
##D y <- 3*x[, 1] + 5*(x[, 3])^2 + error
##D res <- bcorsis(y = y, x = x)
##D head(res[["ix"]])
##D 
##D ############### BCor-SIS: Censored Data Example ###############
##D data("genlung")
##D result <- bcorsis(x = genlung[["covariate"]], y = genlung[["survival"]], 
##D                   method = "survival")
##D index <- result[["ix"]]
##D top_gene <- colnames(genlung[["covariate"]])[index]
##D head(top_gene, n = 1)
##D 
##D 
##D ############### BCor-SIS: Interaction Pursuing ###############
##D set.seed(1)
##D n <- 150
##D p <- 3000
##D x <- matrix(rnorm(n * p), nrow = n)
##D error <- rnorm(n)
##D y <- 3*x[, 1]*x[, 5]*x[, 10] + error
##D res <- bcorsis(y = y, x = x, method = "interaction")
##D head(res[["ix"]])
##D 
##D ############### BCor-SIS: Iterative Method ###############
##D library(mvtnorm)
##D set.seed(1)
##D n <- 150
##D p <- 3000
##D sigma_mat <- matrix(0.5, nrow = p, ncol = p)
##D diag(sigma_mat) <- 1
##D x <- rmvnorm(n = n, sigma = sigma_mat)
##D error <- rnorm(n)
##D rm(sigma_mat); gc(reset = TRUE)
##D y <- 3*(x[, 1])^2 + 5*(x[, 2])^2 + 5*x[, 8] - 8*x[, 16] + error
##D res <- bcorsis(y = y, x = x, method = "lm", d = 15)
##D res <- bcorsis(y = y, x = x, method = "gam", d = 15)
##D res[["ix"]]
##D 
##D ############### Weighted BCor-SIS: Probability weight ###############
##D set.seed(1)
##D n <- 150
##D p <- 3000
##D x <- matrix(rnorm(n * p), nrow = n)
##D error <- rnorm(n)
##D y <- 3*x[, 1] + 5*(x[, 3])^2 + error
##D res <- bcorsis(y = y, x = x, weight = "prob")
##D head(res[["ix"]])
##D # Alternative, chisq weight:
##D res <- bcorsis(y = y, x = x, weight = "chisq")
##D head(res[["ix"]])
## End(Not run)



