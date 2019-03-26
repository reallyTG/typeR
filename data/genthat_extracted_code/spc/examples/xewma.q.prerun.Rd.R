library(spc)


### Name: xewma.q.prerun
### Title: Compute RL quantiles of EWMA control charts in case of estimated
###   parameters
### Aliases: xewma.q.prerun xewma.q.crit.prerun
### Keywords: ts

### ** Examples

## Jones/Champ/Rigdon (2001)

c4m <- function(m, n) sqrt(2)*gamma( (m*(n-1)+1)/2 )/sqrt( m*(n-1) )/gamma( m*(n-1)/2 )

n <- 5 # sample size
m <- 20 # pre run with 20 samples of size n = 5
C4m <- c4m(m, n) # needed for bias correction

# Table 1, 3rd column
lambda <- 0.2
L <- 2.636

xewma.Q <- Vectorize("xewma.q", "mu")
xewma.Q.prerun <- Vectorize("xewma.q.prerun", "mu")

mu <- c(0, .25, .5, 1, 1.5, 2)
Q1  <- ceiling(xewma.Q(lambda, L, mu, 0.1, sided="two"))
Q2  <- ceiling(xewma.Q(lambda, L, mu, 0.5, sided="two"))
Q3  <- ceiling(xewma.Q(lambda, L, mu, 0.9, sided="two"))

cbind(mu, Q1, Q2, Q3)

## Not run: 
##D p.Q1 <- xewma.Q.prerun(lambda, L/C4m, mu, 0.1, sided="two", 
##D size=m, df=m*(n-1), estimated="both")
##D p.Q2 <- xewma.Q.prerun(lambda, L/C4m, mu, 0.5, sided="two",
##D size=m, df=m*(n-1), estimated="both")
##D p.Q3 <- xewma.Q.prerun(lambda, L/C4m, mu, 0.9, sided="two",
##D size=m, df=m*(n-1), estimated="both")
##D 
##D cbind(mu, p.Q1, p.Q2, p.Q3)
## End(Not run)

## original values are
#    mu Q1  Q2  Q3 p.Q1 p.Q2 p.Q3
#  0.00 25 140 456   13   73  345
#  0.25 12  56 174    9   46  253
#  0.50  7  20  56    6   20  101
#  1.00  4   7  15    3    7   18
#  1.50  3   4   7    2    4    8
#  2.00  2   3   5    2    3    5



