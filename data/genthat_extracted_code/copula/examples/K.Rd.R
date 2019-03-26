library(copula)


### Name: K
### Title: Kendall Distribution Function for Archimedean Copulas
### Aliases: Kn pK qK dK rK K
### Keywords: distribution

### ** Examples

tau <- 0.5
(theta <- copGumbel@iTau(tau)) # 2
d <- 20
(cop <- onacopulaL("Gumbel", list(theta,1:d)))

## Basic check of the empirical Kendall distribution function
set.seed(271)
n <- 1000
U <- rCopula(n, copula = cop)
X <- qnorm(U)
K.sample <- pCopula(U, copula = cop)
u <- seq(0, 1, length.out = 256)
edfK <- ecdf(K.sample)
plot(u, edfK(u), type = "l", ylim = 0:1,
     xlab = quote(italic(u)), ylab = quote(K[n](italic(u)))) # simulated
K.n <- Kn(u, x = X)
lines(u, K.n, col = "royalblue3") # Kn
## Difference at 0
edfK(0) # edf of K at 0
K.n[1] # K_n(0); this is > 0 since K.n is the edf of a discrete distribution
## => therefore, Kn(K.sample, x = X) is not uniform
plot(Kn(K.sample, x = X), ylim = 0:1)
## Note: Kn(0) -> 0 for n -> Inf

## Compute Kendall distribution function
u <- seq(0,1, length.out = 255)
Ku    <- pK(u, copula = cop@copula, d = d) # exact
Ku.MC <- pK(u, copula = cop@copula, d = d, n.MC = 1000) # via Monte Carlo
stopifnot(all.equal(log(Ku),
		    pK(u, copula = cop@copula, d = d, log.p=TRUE)))# rel.err 3.2e-16

## Build sample from K
set.seed(1)
n <- 200
W <- rK(n, copula = cop)

## Plot empirical distribution function based on W
## and the corresponding theoretical Kendall distribution function
## (exact and via Monte Carlo)
plot(ecdf(W), col = "blue", xlim = 0:1, verticals=TRUE,
     main = quote("Empirical"~ F[n](C(U)) ~
                     "and its Kendall distribution" ~ K(u)),
     do.points = FALSE, asp = 1)
abline(0,1, lty = 2); abline(h = 0:1, v = 0:1, lty = 3, col = "gray")
lines(u, Ku.MC, col = "red") # not quite monotone
lines(u, Ku, col = "black")  # strictly  monotone:
stopifnot(diff(Ku) >= 0)
legend(.25, .75, expression(F[n], K[MC](u), K(u)),
       col=c("blue" , "red", "black"), lty = 1, lwd = 1.5, bty = "n")

if(require("Rmpfr")) { # pK() now also works with high precision numbers:
 uM <- mpfr(0:255, 99)/256
 if(FALSE) {
   # not yet, now fails in  polyG() :
   KuM <- pK(uM, copula = cop@copula, d = d)
  ##  debug(copula:::.pK)
  debug(copula:::polyG)
 }
}# if( Rmpfr )


## Testing qK
pexpr <- quote( 0:63/63 );  p <- eval(pexpr)
d <- 10
cop <- onacopulaL("Gumbel", list(theta = 2, 1:d))
system.time(qK0 <- qK(p, copula = cop@copula, d = d)) # "default" - fast
## No test: 

system.time(qK1  <- qK(p, copula= cop@copula, d=d, method = "simple"))
system.time(qK1. <- qK(p, copula= cop@copula, d=d, method = "simple", tol = 1e-12))
system.time(qK2  <- qK(p, copula= cop@copula, d=d, method = "sort"))
system.time(qK2. <- qK(p, copula= cop@copula, d=d, method = "sort",   tol = 1e-12))
system.time(qK3  <- qK(p, copula= cop@copula, d=d, method = "discrete", u.grid = 0:1e4/1e4))
system.time(qK4  <- qK(p, copula= cop@copula, d=d, method = "monoH.FC",
                       u.grid = 0:5e2/5e2))
system.time(qK4. <- qK(p, copula= cop@copula, d=d, method = "monoH.FC",
                       u.grid = 0:5e2/5e2, tol = 1e-12))
system.time(qK5  <- qK(p, copula= cop@copula, d=d, method = "monoH.FC",
                       u.grid = 0:5e3/5e3))
system.time(qK5. <- qK(p, copula= cop@copula, d=d, method = "monoH.FC",
                       u.grid = 0:5e3/5e3, tol = 1e-12))
system.time(qK6  <- qK(p, copula= cop@copula, d=d, method = "monoH.FC",
                       u.grid = (0:5e3/5e3)^2))
system.time(qK6. <- qK(p, copula= cop@copula, d=d, method = "monoH.FC",
                       u.grid = (0:5e3/5e3)^2, tol = 1e-12))

## Visually they all coincide :
cols <- adjustcolor(c("gray50", "gray80", "light blue",
                      "royal blue", "purple3", "purple4", "purple"), 0.6)
matplot(p, cbind(qK0, qK1, qK2, qK3, qK4, qK5, qK6), type = "l", lwd = 2*7:1, lty = 1:7, col = cols,
        xlab = bquote(p == .(pexpr)), ylab = quote({K^{-1}}(u)),
        main = "qK(p, method = *)")
legend("topleft", col = cols, lwd = 2*7:1, lty = 1:7, bty = "n", inset = .03,
       legend= paste0("method= ",
             sQuote(c("default", "simple", "sort",
                      "discrete(1e4)", "monoH.FC(500)", "monoH.FC(5e3)", "monoH.FC(*^2)"))))

## See they *are* inverses  (but only approximately!):
eqInv <- function(qK) all.equal(p, pK(qK, cop@copula, d=d), tol=0)

eqInv(qK0 ) # "default"	       0.03  worst
eqInv(qK1 ) # "simple"	       0.0011 - best
eqInv(qK1.) # "simple", e-12   0.00000 (8.73 e-13) !
eqInv(qK2 ) # "sort"	       0.0013 (close)
eqInv(qK2.) # "sort", e-12     0.00000 (7.32 e-12)
eqInv(qK3 ) # "discrete"       0.0026
eqInv(qK4 ) # "monoH.FC(500)"  0.0095
eqInv(qK4.) # "m.H.FC(5c)e-12" 0.00963
eqInv(qK5 ) # "monoH.FC(5e3)"  0.001148
eqInv(qK5.) # "m.H.FC(5k)e-12" 0.000989
eqInv(qK6 ) # "monoH.FC(*^2)"  0.001111
eqInv(qK6.) # "m.H.FC(*^2)e-12"0.00000 (1.190 e-09)

## and ensure the differences are not too large
stopifnot(
 all.equal(qK0, qK1, tol = 1e-2) # !
 ,
 all.equal(qK1, qK2, tol = 1e-4)
 ,
 all.equal(qK2, qK3, tol = 1e-3)
 ,
 all.equal(qK3, qK4, tol = 1e-3)
 ,
 all.equal(qK4, qK0, tol = 1e-2) # !
)

## End(No test)
stopifnot(all.equal(p, pK(qK0, cop@copula, d=d), tol = 0.04))



