library(copula)


### Name: RSpobs
### Title: Pseudo-Observations of Radial and Uniform Part of Elliptical and
###   Archimedean Copulas
### Aliases: RSpobs
### Keywords: utilities

### ** Examples

set.seed(100)
n <- 250 # sample size
d <- 5 # dimension
nu <- 3 # degrees of freedom

## Build a mean vector and a dispersion matrix,
## and generate multivariate t_nu data:
mu <- rev(seq_len(d)) # d, d-1, .., 1
L <- diag(d) # identity in dim d
L[lower.tri(L)] <- 1:(d*(d-1)/2)/d # Cholesky factor (diagonal > 0)
Sigma <- crossprod(L) # pos.-def. dispersion matrix (*not* covariance of X)
X <- rep(mu, each=n) + mvtnorm::rmvt(n, sigma=Sigma, df=nu) # multiv. t_nu data
## note: this is *wrong*: mvtnorm::rmvt(n, mean=mu, sigma=Sigma, df=nu)

## compute pseudo-observations of the radial part and uniform distribution
## once for 1a), once for 1b) below
RS.t    <- RSpobs(X, method="ellip", qQg=function(p) qt(p, df=nu)) # 'correct'
RS.norm <- RSpobs(X, method="ellip", qQg=qnorm) # for testing 'wrong' distribution
stopifnot(length(RS.norm$R) == n, length(RS.t$R) == n,
          dim(RS.norm$S) == c(n,d), dim(RS.t$S) == c(n,d))

## 1) Graphically testing the radial part

## 1a) Q-Q plot of R against the correct quantiles
qqplot2(RS.t$R, qF=function(p) sqrt(d*qf(p, df1=d, df2=nu)),
        main.args=list(text= substitute(bold(italic(F[list(d.,nu.)](r^2/d.))~~"Q-Q Plot"),
                                        list(d.=d, nu.=nu)),
		       side=3, cex=1.3, line=1.1, xpd=NA))

## 1b) Q-Q plot of R against the quantiles of F_R for a multivariate normal
##     distribution
qqplot2(RS.norm$R, qF=function(p) sqrt(qchisq(p, df=d)),
        main.args=list(text= substitute(bold(italic(chi[D_]) ~~ "Q-Q Plot"), list(D_=d)),
               side=3, cex=1.3, line=1.1, xpd=NA))

## 2) Graphically testing the angular distribution

## auxiliary function
qqp <- function(k, Bmat) {
    d <- ncol(Bmat) + 1
    qqplot2(Bmat[,k],
            qF = function(p) qbeta(p, shape1=k/2, shape2=(d-k)/2),
            main.args=list(text= substitute(plain("Beta")(s1,s2) ~~ bold("Q-Q Plot"),
                                            list(s1 = k/2, s2 = (d-k)/2)),
  	                   side=3, cex=1.3, line=1.1, xpd=NA))
}

## 2a) Q-Q plot of the 'correct' angular distribution
##     (Bmat[,k] should follow a Beta(k/2, (d-k)/2) distribution)
Bmat.t <- gofBTstat(RS.t$S)
qqp(1, Bmat=Bmat.t) # k=1
qqp(3, Bmat=Bmat.t) # k=3

## 2b) Q-Q plot of the 'wrong' angular distribution
Bmat.norm <- gofBTstat(RS.norm$S)
qqp(1, Bmat=Bmat.norm) # k=1
qqp(3, Bmat=Bmat.norm) # k=3

## 3) Graphically check independence between radial part and B_1 and B_3

## 'correct' distributions (multivariate t)
plot(pobs(cbind(RS.t$R, Bmat.t[,1])), # k = 1
          xlab=quote(italic(R)), ylab=quote(italic(B)[1]),
          main=quote(bold("Rank plot between"~~italic(R)~~"and"~~italic(B)[1])))
plot(pobs(cbind(RS.t$R, Bmat.t[,3])), # k = 3
	  xlab=quote(italic(R)), ylab=quote(italic(B)[3]),
          main=quote(bold("Rank plot between"~~italic(R)~~"and"~~italic(B)[3])))

## 'wrong' distributions (multivariate normal)
plot(pobs(cbind(RS.norm$R, Bmat.norm[,1])), # k = 1
          xlab=quote(italic(R)), ylab=quote(italic(B)[1]),
          main=quote(bold("Rank plot between"~~italic(R)~~"and"~~italic(B)[1])))
plot(pobs(cbind(RS.norm$R, Bmat.norm[,3])), # k = 3
	  xlab=quote(italic(R)), ylab=quote(italic(B)[3]),
          main=quote(bold("Rank plot between"~~italic(R)~~"and"~~italic(B)[3])))



