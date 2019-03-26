library(sads)


### Name: dtrunc
### Title: Left-truncation of density, probability and quantile of
###   distributions
### Aliases: dtrunc ptrunc qtrunc rtrunc

### ** Examples

A <- dtrunc("lnorm", x = 1:5, trunc = 0.5,
       coef = list( meanlog=1, sdlog=1.5 ) )
## same as
B <- dlnorm( 1:5 , meanlog = 1, sdlog = 1.5 ) /
  ( plnorm ( 0.5 , meanlog = 1, sdlog = 1.5, lower = FALSE))
## checking
identical( A, B )

A <- ptrunc("pois", q = 1:5, trunc = 0,
       coef = list( lambda = 1.5 ) )
## same as
B <- (ppois( 1:5 , lambda = 1.5 ) -
      ppois(0 , lambda = 1.5 ) ) /
  (ppois(0 , lambda = 1.5, lower = FALSE))
## checking
identical(A,B)

# Random generation
rtrunc("ls", 100, coef=list(N=1000, alpha=50), trunc=5)



