library(bigstep)


### Name: bigstep
### Title: Model selection
### Aliases: bigstep bigstep-package

### ** Examples

## Not run: 
##D library(bigstep)
##D 
##D ### small data
##D set.seed(1)
##D n <- 200
##D p <- 20
##D X <- matrix(rnorm(n * p), ncol = p)
##D colnames(X) <- paste0("X", 1:p)
##D y <- 1 + 0.4 * rowSums(X[, c(5, 10, 15, 20)]) + rnorm(n)
##D 
##D data <- prepare_data(y, X)
##D results <- stepwise(data, crit = aic)
##D results$model
##D summary(results)
##D 
##D ### bigger data
##D set.seed(1)
##D n <- 1e3
##D p <- 1e4
##D X <- matrix(rnorm(p * n), ncol = p)
##D colnames(X) <- paste0("X", 1:p)
##D Xadd <- matrix(rnorm(5 * n), n, 5)  # additional variables
##D colnames(Xadd) <- paste0("Xadd", 1:5)
##D y <- 0.2 * rowSums(X[, 1000 * (1:10)]) + Xadd[, 1] - 0.1 * Xadd[, 3] + rnorm(n)
##D 
##D data <- prepare_data(y, X, Xadd = Xadd)
##D data %>%
##D   reduce_matrix(minpv = 0.15) %>%
##D   stepwise(mbic) ->
##D   results
##D summary(results)
##D 
##D ### big data
##D Xbig <- read.big.matrix("X.txt", sep = " ", header = TRUE,
##D                         backingfile = "X.bin", descriptorfile = "X.desc")
##D # Xbig <- attach.big.matrix("X.desc") # much faster
##D y <- read.table("y.txt")
##D # data <- prepare_data(y, Xbig) # slow because of checking NA
##D data <- prepare_data(y, Xbig, na = FALSE) # set if you know that you do not have NA
##D data %>%
##D   reduce_matrix(minpv = 0.001) %>%
##D   fast_forward(crit = bic, maxf = 50) %>%
##D   multi_backward(crit = mbic) %>%
##D   stepwise(crit = mbic) -> m
##D summary(m)
##D 
##D # more examples: type browseVignettes("bigstep")
## End(Not run)




