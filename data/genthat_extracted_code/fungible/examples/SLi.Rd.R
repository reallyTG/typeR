library(fungible)


### Name: SLi
### Title: Conduct a Schmid-Leiman Iterated (SLi) Target Rotation
### Aliases: SLi

### ** Examples

## Generate a bifactor model
bifactor <- matrix(c(.35, .61, .00, .00,
                     .35, .61, .00, .00,
                     .35, .61, .00, .00,
                     .35, .00, .61, .00,
                     .35, .00, .61, .00,
                     .35, .00, .61, .00,
                     .35, .00, .00, .61,
                     .35, .00, .00, .61,
                     .35, .00, .00, .61),
                   nrow = 9, ncol = 4, byrow = TRUE)

## Model-implied correlation (covariance) matrix
R <- bifactor %*% t(bifactor)

## Unit diagonal elements
diag(R) <- 1

Out1 <- SLi(R          = R,
            numFactors = c(3, 1),
            digits     = 2)




