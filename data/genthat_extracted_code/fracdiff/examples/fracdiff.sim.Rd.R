library(fracdiff)


### Name: fracdiff.sim
### Title: Simulate fractional ARIMA Time Series
### Aliases: fracdiff.sim
### Keywords: ts

### ** Examples

## Pretty (too) short to "see" the long memory
fracdiff.sim(100, ar = .2, ma = .4, d = .3)

## longer with "extreme" ar:
r <- fracdiff.sim(n=1500, ar=-0.9, d= 0.3)
plot(as.ts(r$series))

## Show that  MA  coefficients meaning is inverted
## compared to   stats :: arima :

AR <- 0.7
MA <- -0.5
n.st <- 2

AR <- c(0.7, -0.1)
MA <- c(-0.5, 0.4)
n <- 512 ; sd <- 0.1
n.st <- 10

set.seed(101)
Y1 <- arima.sim(list(ar = AR, ma = MA), n = n, n.start = n.st, sd = sd)
plot(Y1)

# For our fracdiff, reverse the MA sign:
set.seed(101)
Y2 <- fracdiff.sim(n = n, ar = AR, ma = - MA, d = 0,
                   n.start = n.st, sd = sd)$series
lines(Y2, col=adjustcolor("red", 0.5))
## .. no, you don't need glasses ;-)  Y2 is Y1 shifted slightly

##' rotate left by k (k < 0: rotate right)
rot <- function(x, k) {
  stopifnot(k == round(k))
  n <- length(x)
  if(k <- k %% n) x[c((k+1):n, 1:k)] else x
}
k <- n.st - 2
Y2.s <- rot(Y2, k)
head.matrix(cbind(Y1, Y2.s))
plot(Y1, Y2.s); i <- (n-k+1):n
text(Y1[i], Y2.s[i], i, adj = c(0,0)-.1, col=2)

## With  backComp = FALSE,  get *the same* as arima.sim():
set.seed(101)
Y2. <- fracdiff.sim(n = n, ar = AR, ma = - MA, d = 0,
                    n.start = n.st, sd = sd, backComp = FALSE)$series
stopifnot( all.equal( c(Y1), Y2., tol= 1e-15))



