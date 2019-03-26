library(fungible)


### Name: SchmidLeiman
### Title: Schmid-Leiman Orthogonalization to a (Rank-Deficient) Bifactor
###   Structure
### Aliases: SchmidLeiman

### ** Examples

## Dataset used in Schmid & Leiman (1957) rounded to 2 decimal places
SLdata <-
  matrix(c(1.0, .72, .31, .27, .10, .05, .13, .04, .29, .16, .06, .08,
           .72, 1.0, .35, .30, .11, .06, .15, .04, .33, .18, .07, .08,
           .31, .35, 1.0, .42, .08, .04, .10, .03, .22, .12, .05, .06,
           .27, .30, .42, 1.0, .06, .03, .08, .02, .19, .11, .04, .05,
           .10, .11, .08, .06, 1.0, .32, .13, .04, .11, .06, .02, .03,
           .05, .06, .04, .03, .32, 1.0, .07, .02, .05, .03, .01, .01,
           .13, .15, .10, .08, .13, .07, 1.0, .14, .14, .08, .03, .04,
           .04, .04, .03, .02, .04, .02, .14, 1.0, .04, .02, .01, .01,
           .29, .33, .22, .19, .11, .05, .14, .04, 1.0, .45, .15, .17,
           .16, .18, .12, .11, .06, .03, .08, .02, .45, 1.0, .08, .09,
           .06, .07, .05, .04, .02, .01, .03, .01, .15, .08, 1.0, .42,
           .08, .08, .06, .05, .03, .01, .04, .01, .17, .09, .42, 1.0),
         nrow = 12, ncol = 12, byrow = TRUE)

Out1 <- SchmidLeiman(R          = SLdata,
                     numFactors = c(6, 3, 1),
                     digits     = 2)$B

## An orthogonalization of a two-order structure
bifactor <- matrix(c(.46, .57, .00, .00,
                     .48, .61, .00, .00,
                     .61, .58, .00, .00,
                     .46, .00, .55, .00,
                     .51, .00, .62, .00,
                     .46, .00, .55, .00,
                     .47, .00, .00, .48,
                     .50, .00, .00, .50,
                     .49, .00, .00, .49),
                   nrow = 9, ncol = 3, byrow = TRUE)

## Model-implied correlation (covariance) matrix
R <- bifactor %*% t(bifactor)

## Unit diagonal elements
diag(R) <- 1

Out2 <- SchmidLeiman(R          = R,
                     numFactors = c(3, 1),
                     rotate     = "oblimin",
                     digits     = 2)$B




