library(fungible)


### Name: promaxQ
### Title: Conduct an Oblique Promax Rotation
### Aliases: promaxQ

### ** Examples

## Generate an orthgonal factor model
lambda <- matrix(c(.41, .00, .00,
                   .45, .00, .00,
                   .53, .00, .00,
                   .00, .66, .00,
                   .00, .38, .00,
                   .00, .66, .00,
                   .00, .00, .68,
                   .00, .00, .56,
                   .00, .00, .55),
                 nrow = 9, ncol = 3, byrow = TRUE)

## Model-implied correlation (covariance) matrix
R <- lambda %*% t(lambda)

## Unit diagonal elements
diag(R) <- 1

## Start from just a correlation matrix
Out1 <- promaxQ(R           = R,
                facMethod   = "fals",
                numFactors  = 3,
                power       = 4,
                standardize = "Kaiser")$loadings

## Iterate the promaxQ rotation using the rotate function
Out2 <- faMain(R             = R,
               facMethod     = "fals",
               numFactors    = 3,
               rotate        = "promaxQ",
               rotateControl = list(power       = 4,
                                    standardize = "Kaiser"))$loadings

## Align the factors to have the same orientation
Out1 <- faAlign(F1 = Out2,
                F2 = Out1)$F2

## Show the equivalence of factor solutions from promaxQ and rotate
all.equal(Out1, Out2, check.attributes = FALSE)




