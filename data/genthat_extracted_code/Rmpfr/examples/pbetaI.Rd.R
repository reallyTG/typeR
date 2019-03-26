library(Rmpfr)


### Name: pbetaI
### Title: Accurate Incomplete Beta / Beta Probabilities For Integer Shapes
### Aliases: pbetaI
### Keywords: arith distribution

### ** Examples

x <- (0:12)/16 # not all the way up ..
a <- 7; b <- 788

p.  <- pbetaI(x, a, b) ## still slow: %% TOO slow -- FIXME
pp  <- pbetaI(x, a, b, precBits = 2048)
## Currently, the lower.tail=FALSE  are computed "badly":
lp  <- log(pp)    ## = pbetaI(x, a, b, log.p=TRUE)
lIp <- log1p(-pp) ## = pbetaI(x, a, b, lower.tail=FALSE, log.p=TRUE)
 Ip <- 1 - pp     ## = pbetaI(x, a, b, lower.tail=FALSE)

if(Rmpfr:::doExtras()) { ## somewhat slow
   stopifnot(
     all.equal(lp,  pbetaI(x, a, b, precBits = 2048, log.p=TRUE)),
     all.equal(lIp, pbetaI(x, a, b, precBits = 2048, lower.tail=FALSE, log.p=TRUE),
               tol = 1e-230),
     all.equal( Ip, pbetaI(x, a, b, precBits = 2048, lower.tail=FALSE))
   )
}

rErr <- function(approx, true, eps = 1e-200) {
    true <- as.numeric(true) # for "mpfr"
    ifelse(Mod(true) >= eps,
           ## relative error, catching '-Inf' etc :
	   ifelse(true == approx, 0, 1 - approx / true),
           ## else: absolute error (e.g. when true=0)
	   true - approx)
}

rErr(pbeta(x, a, b), pp)
rErr(pbeta(x, a, b, lower=FALSE), Ip)
rErr(pbeta(x, a, b, log = TRUE),  lp)
rErr(pbeta(x, a, b, lower=FALSE, log = TRUE),  lIp)

a.EQ <- function(..., tol=1e-15) all.equal(..., tolerance=tol)
stopifnot(
  a.EQ(pp,  pbeta(x, a, b)),
  a.EQ(lp,  pbeta(x, a, b, log.p=TRUE)),
  a.EQ(lIp, pbeta(x, a, b, lower.tail=FALSE, log.p=TRUE)),
  a.EQ( Ip, pbeta(x, a, b, lower.tail=FALSE))
 )



