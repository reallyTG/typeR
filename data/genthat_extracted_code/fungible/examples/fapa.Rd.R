library(fungible)


### Name: fapa
### Title: Iterated Principal Axis Factor Analysis (fapa)
### Aliases: fapa

### ** Examples

## Generate an example factor structure matrix
lambda <- matrix(c(.62, .00, .00,
                   .54, .00, .00,
                   .41, .00, .00,
                   .00, .31, .00,
                   .00, .58, .00,
                   .00, .62, .00,
                   .00, .00, .38,
                   .00, .00, .43,
                   .00, .00, .37),
                 nrow = 9, ncol = 3, byrow = TRUE)

## Find the model implied correlation matrix
R <- lambda %*% t(lambda)
diag(R) <- 1

## Extract factors using the fapa function
Out1 <- fapa(R           = R,
             numFactors  = 3,
             communality = "SMC")

## Call fapa through the factExtract function
Out2 <- faX(R          = R,
            numFactors = 3,
            facMethod  = "fapa",
            faControl  = list(communality = "maxRsqr",
                              epsilon     = 1e-4))

## Check for equivalence of the two results
all.equal(Out1$loadings, Out2$loadings)





