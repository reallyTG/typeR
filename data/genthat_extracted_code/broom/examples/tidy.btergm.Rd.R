library(broom)


### Name: tidy.btergm
### Title: Tidy a(n) btergm object
### Aliases: tidy.btergm btergm_tidiers

### ** Examples


if (require("xergm")) {
    set.seed(1)
    # Using the same simulated example as the xergm package
    # Create 10 random networks with 10 actors
    networks <- list()
    for(i in 1:10){
        mat <- matrix(rbinom(100, 1, .25), nrow = 10, ncol = 10)
        diag(mat) <- 0
        nw <- network::network(mat)
        networks[[i]] <- nw
    }
    # Create 10 matrices as covariates
    covariates <- list()
    for (i in 1:10) {
        mat <- matrix(rnorm(100), nrow = 10, ncol = 10)
        covariates[[i]] <- mat
    }
    # Fit a model where the propensity to form ties depends
    # on the edge covariates, controlling for the number of
    # in-stars
    suppressWarnings(btfit <- btergm(networks ~ edges + istar(2) +
                       edgecov(covariates), R = 100))

    # Show terms, coefficient estimates and errors
    tidy(btfit)

    # Show coefficients as odds ratios with a 99% CI
    tidy(btfit, exponentiate = TRUE, conf.level = 0.99)
}




