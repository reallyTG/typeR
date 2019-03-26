library(widals)


### Name: Hst.sumup
### Title: Create Covariance Matrix
### Aliases: Hst.sumup
### Keywords: ~kwd1 ~kwd2

### ** Examples

	
tau <- 20
n <- 10
Ht <- cbind(sin(1:tau), cos(1:tau))

Hs <- cbind(rnorm(10), rnorm(n, 5, 49))

Hst.ls <- list()
for(tt in 1:tau) {
Hst.ls[[tt]] <- cbind(rnorm(n, 1, 0.1), rnorm(n, -200, 21))
}


Hst.sumup(Hst.ls, Hs, Ht)



########### standardize all covariates

x1 <- stnd.Hst.ls(Hst.ls, NULL)$sHst.ls
x2 <- stnd.Hs(Hs, NULL, FALSE)$sHs
x3 <- stnd.Ht(Ht, n)


Hst.sumup(x1, x2, x3)



## The function is currently defined as
function (Hst.ls, Hs = NULL, Ht = NULL) 
{
    tau <- length(Hst.ls)
    if(tau < 1) { tau <- nrow(Ht) }
    if(is.null(tau)) { tau <- 10 ; cat("tau assumed to be 10.", "\n") }
    n <- nrow(Hst.ls[[1]])
    if(is.null(n)) { n <- nrow(Hs) }
    big.sum <- 0
    for (i in 1:tau) {
        if (!is.null(Ht)) {
            Ht.mx <- matrix(Ht[i, ], n, ncol(Ht), byrow = TRUE)
        }
        else {
            Ht.mx <- NULL
        }
        big.sum <- big.sum + crossprod(cbind(Hs, Ht.mx, Hst.ls[[i]]))
    }
    return(big.sum)
  }



