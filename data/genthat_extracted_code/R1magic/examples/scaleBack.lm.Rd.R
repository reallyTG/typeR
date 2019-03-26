library(R1magic)


### Name: scaleBack.lm
### Title: Transform back multiple regression coefficients to unscaled
###   regression coefficients Original question posed by Mark Seeto on the
###   R mailing list.
### Aliases: scaleBack.lm

### ** Examples

set.seed(4242)
 X            <- matrix(rnorm(12), 4, 3)
 Y            <- matrix(rnorm(4), 4, 1)
 betas.scaled <- matrix(rnorm(3), 3, 1)
 betas        <- scaleBack.lm(X, Y, betas.scaled)



