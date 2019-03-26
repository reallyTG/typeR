library(copBasic)


### Name: asCOP
### Title: A Wrapper on a User-Level Formula to Become a Copula Function
### Aliases: asCOP
### Keywords: copula (utilities) copula (formulas) Nelsen (2006) Examples
###   and Exercises shuffle (in Examples) triangle (in Examples)

### ** Examples

## Not run: 
##D # Concerning Nelsen (2006, exer. 3.7, pp. 64--65)
##D "trianglecop" <- function(u,v, para=NULL, ...) {
##D    # If para is set, then the triangle is rotated 90d clockwise.
##D    if(! is.null(para) && para == 1) { t <- u; u <- v; v <- t }
##D    if(length(u) > 1 | length(v) > 1) stop("only scalars for this function")
##D    v2<-v/2; if(0   <= u    &  u   <= v2 & v2 <= 1/2) { return(u    )
##D    } else   if(0   <= v2   & v2   <  u  &  u < 1-v2) { return(v2   )
##D    } else   if(1/2 <= 1-v2 & 1-v2 <= u  &  u <= 1  ) { return(u+v-1)
##D    } else { stop("should not be here in logic") }
##D }
##D "UsersCop" <- function(u,v, ...) { asCOP(u,v, f=trianglecop, ...) }
##D n=20000; UV <- simCOP(n=n, cop=UsersCop)
##D # The a-d elements of the problem now follow:
##D # (a) Pr[V = 1 - |2*U -1|] = 1 and Cov(U,V) = 0; so that two random variables
##D # can be uncorrelated but each is perfectly predictable from the other
##D mean(UV$V - (1 - abs(2*UV$U -1))) # near zero; Nelsen says == 0
##D cov(UV$U, UV$V)                   # near zero; Nelsen says == 0
##D # (b) Cop(m,n) = Cop(n,m); so that two random variables can be identically
##D # distributed, uncorrelated, and not exchangeable
##D EMPIRcop(0.95,0.17, para=UV) # = A
##D EMPIRcop(0.17,0.95, para=UV) # = B; then A != B
##D # (c) Pr[V - U > 0] = 2/3; so that two random variables can be identically
##D # distributed, but their difference need not be symmetric about zero
##D tmp <- (UV$V - UV$U) > 0
##D length(tmp[tmp == TRUE])/n # about 2/3; Nelsen says == 2/3
##D # the prior two lines yield about 1/2 for independence copula P()
##D # (d) Pr[X + Y > 0] = 2/3; so that uniform random variables on (-1,1) can each
##D # be symmetric about zero, but their sum need not be.
##D tmp <- ((2*UV$V - 1) + (2*UV$U - 1)) > 0
##D length(tmp[tmp == TRUE])/n # about 2/3; Nelsen says == 2/3
##D 
##D # Concerning Nelsen (2006, exam. 3.10, p. 73)
##D "shufflecop" <- # assume scalar arguments for u and v
##D function(u,v, para, ...) {
##D    m <- para$mixer; subcop <- para$subcop
##D    if(is.na(m) | m <= 0 | m >= 1) stop("m ! in [0,1]")
##D    if(u <= m) { return(    subcop(1-m+u, v, para=para$para) -
##D                            subcop(1-m,   v, para=para$para))
##D    } else {     return(v - subcop(1-m,   v, para=para$para) +
##D                            subcop(u-m,   v, para=para$para))
##D    }
##D }
##D "UsersCop" <- function(u,v, para=NULL) {
##D    asCOP(u,v, f=shufflecop, para=para)
##D }
##D n <- 1000; u <- runif(n)
##D para <- list(mixer=runif(1), subcop=W, para=20)
##D v <- sapply(1:n, function(i) {
##D       simCOPmicro(u[i], cop=UsersCop, para=para) } )
##D plot(data.frame(U=u, V=v), pch=17, col=rgb(1,0,1,1),
##D      xlab="U, NONEXCEEDANCE PROBABILTY", ylab="V, NONEXCEEDANCE PROBABILITY")
##D mtext("Plackett mixed with a Convex Copula Sum")
##D 
##D #optimize(function(k) { nuskewCOP(cop=UsersCop,
##D #         para=list(mixer=k, subcop=M)) }, interval=c(0.01,0.99))
##D # Note (2018-12-28): Now 96 is the nuskewCOP multiplier, but with shuffling of M,
##D # we can drive the maximum to +/-1.539598, which implies perhaps a multiplier of
##D # 1/(1.539598/96) of 62.35394. But the 96 inflates the skewness scale more and
##D # more inline with the scale of nustarCOP() for practical application of using them
##D # for parameter estimation (see joeskewCOP Note section).
##D 
##D # Concerning Nelsen (2006, exam. 5.14, p. 195)
##D "deltacop" <- function(u,v, ...) { min(c(u,v,(u^2+v^2)/2))     }
##D "UsersCop" <- function(u,v, ...) { asCOP(u,v, f=deltacop, ...) }
##D isCOP.PQD(cop=UsersCop) # TRUE + Rho=0.288 and Tau=0.333 as Nelsen says
##D isCOP.LTD(cop=UsersCop, wrtV=TRUE) # FALSE as Nelsen says
##D isCOP.RTI(cop=UsersCop, wrtV=TRUE) # FALSE as Nelsen says
## End(Not run)



