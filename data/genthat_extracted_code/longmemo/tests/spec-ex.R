library(longmemo)

###-------------- Comparison of Paxson's approximation to B(): -----------------

B.o.specFGN <- function(lam, H, nsum=200)
    B.specFGN(lam, H, k.approx=NA, nsum=nsum)
all.equal(B.specFGN  (.ffreq(1000), 0.8),
          B.o.specFGN(.ffreq(1000), 0.8))
## 4.853 e-5

relErr <- function(target, current) {
    xn <- mean(abs(target))
    stopifnot(is.finite(xn))
    if(xn == 0) { warning("target=0 -> using absolute average error"); xn <- 1 }
    mean(abs(target-current)) / xn
}

## the relative error of the approxmation depends on  H, not on n
## and seems worst for  H = 0.5
H.s <- seq(0.5, 1, by= 1/32)
n.s <- c(25, 50, 100, 200, 500, 999, 2001)
p0 <- function(...) paste(..., sep="")
n.H <- function(H) p0("H=",formatC(H,digits=2,width=1))
n.n <- function(n) p0("n=",as.character(n))
rE <- matrix(NA, length(H.s), length(n.s),
             dimnames=list(n.H(H.s), n.n(n.s)))

for(H in H.s) {
    ## the relative error of the approxmation depends on  H, not on n
    ## and seems worst for  H = 0.5
    cat("H =", H,": ")
    for(n in n.s) {
        cat(".")
        fr <- .ffreq(n)
        rE[n.H(H), n.n(n)] <-
            relErr(target = B.o.specFGN(fr, H, nsum=1000),
                   current= B.specFGN  (fr, H))
    ## stopifnot(all.equal(B.specFGN  (fr, H),
    ##                     B.o.specFGN(fr, H, nsum=500),
    ##                     tol = .25/n))
    }
    cat("\n")
}

round(log10(rE), 2)

cat('Time elapsed: ', proc.time(),'\n') # "statistics"
