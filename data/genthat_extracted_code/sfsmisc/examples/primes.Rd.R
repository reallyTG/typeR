library(sfsmisc)


### Name: primes
### Title: Find all Primes Less Than n
### Aliases: primes
### Keywords: math arithmetic

### ** Examples

 (p1 <- primes(100))
 system.time(p1k <- primes(1000)) # still lightning fast
 stopifnot(length(p1k) == 168)
## No test: 
 system.time(p.e7 <- primes(1e7)) # still only 0.3 sec (2015 (i7))
 stopifnot(length(p.e7) == 664579)
 ## The famous  pi(n) :=  number of primes <= n:
 pi.n <- approxfun(p.e7, seq_along(p.e7), method = "constant")
 pi.n(c(10, 100, 1000)) # 4 25 168
 plot(pi.n, 2, 1e7, n = 1024, log="xy", axes = FALSE,
      xlab = "n", ylab = quote(pi(n)),
      main = quote("The prime number function " ~ pi(n)))
 eaxis(1); eaxis(2)
## End(No test)
## Exploring  p(n) := the n-th prime number :
## pnn(n) := log n + log log n
pnn <- function(n) { L <- log(n); L + log(L) }
n <- 6:(N <- length(PR <- primes(1e5)))
m.pn <- cbind(l.pn = ceiling(n*(pnn(n)-1)), pn = PR[n], u.pn = floor(n*pnn(n)))
matplot(n, m.pn, type="l", ylab = quote(p[n]), main = quote(p[n] ~~
        "with lower/upper bounds" ~ n*(log(n) + log(log(n)) -(1~"or"~0))))
plot(n, PR[n]/n - (pnn(n)-1), type = 'l', cex = 1/8, log="x", xaxt="n")
eaxis(1); abline(h=0, col=adjustcolor(1, 0.5))



