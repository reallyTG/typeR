library(ccdrAlgorithm)


### Name: ccdr.run
### Title: Main CCDr Algorithm
### Aliases: ccdr.run

### ** Examples


### Generate some random data
dat <- matrix(rnorm(1000), nrow = 20)
dat <- sparsebnUtils::sparsebnData(dat, type = "continuous")

# Run with default settings
ccdr.run(data = dat, lambdas.length = 20)

### Optional: Adjust settings
pp <- ncol(dat$data)

# Initialize algorithm with a random initial value
init.betas <- matrix(0, nrow = pp, ncol = pp)
init.betas[1,2] <- init.betas[1,3] <- init.betas[4,2] <- 1

# Run with adjusted settings
ccdr.run(data = dat, betas = init.betas, lambdas.length = 20, alpha = 10, verbose = TRUE)




