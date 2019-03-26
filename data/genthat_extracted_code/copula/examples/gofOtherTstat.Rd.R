library(copula)


### Name: gofOtherTstat
### Title: Various Goodness-of-fit Test Statistics
### Aliases: gofBTstat
### Keywords: htest goodness-of-fit distribution multivariate

### ** Examples

## generate data on the unit sphere
n <- 360
d <- 5
set.seed(1)
x <- matrix(rnorm(n*d), ncol=d)
U <- x/sqrt(rowSums(x^2))

## compute the test statistics B_k, k in {1,..,d-1}
Bmat <- gofBTstat(U)

## (graphically) check if Bmat[,k] follows a Beta(k/2, (d-k)/2) distribution
qqp <- function(k, Bmat) {
    d <- ncol(Bmat)+1L
    tit <- substitute(plain("Beta")(.A.,.B.)~~ bold("Q-Q Plot"),
                      list(.A. = k/2, .B. = (d-k)/2))
    qqplot2(Bmat[,k], qF=function(p) qbeta(p, shape1=k/2, shape2=(d-k)/2),
            main.args=list(text=tit, side=3, cex=1.3, line=1.1, xpd=NA))
}
qqp(1, Bmat=Bmat) # k=1
qqp(3, Bmat=Bmat) # k=3



