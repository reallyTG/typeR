library(copula)


### Name: rnacopula
### Title: Sampling Nested Archimedean Copulas
### Aliases: rnacopula
### Keywords: distribution

### ** Examples

## Construct a three-dimensional nested Clayton copula with parameters
## chosen such that the Kendall's tau of the respective bivariate margins
## are 0.2 and 0.5 :
C3 <- onacopula("C", C(copClayton@iTau(0.2), 1,
                       C(copClayton@iTau(0.5), c(2,3))))
C3
## Don't show: 
stopifnot(nrow(rnacopula(1, C3)) == 1,
          nrow(rnacopula(0, C3)) == 0)
## End(Don't show)
## Sample n vectors of random variates from this copula.  This involves
## sampling exponentially tilted stable distributions
n <- 1000
U <- rnacopula(n, C3)

## Plot the drawn vectors of random variates
splom2(U)



