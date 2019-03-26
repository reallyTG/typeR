library(lmomco)


### Name: lmomtri
### Title: L-moments of the Asymmetric Triangular Distribution
### Aliases: lmomtri
### Keywords: L-moment (distribution) Distribution: Asymmetric Triangular
###   Distribution: Triangular

### ** Examples

lmr <- lmoms(c(46, 70, 59, 36, 71, 48, 46, 63, 35, 52))
lmr
lmomtri(partri(lmr), nmom="5")

par <- vec2par(c(-405, -390, -102), type="tri")
lmomtri(par, nmom="5")$lambdas
# -299           39.4495050    5.5670228    1.9317914    0.8007511
theoLmoms.max.ostat(para=par, qua=quatri, nmom=5)$lambdas
# -299.0000126   39.4494885    5.5670486    1.9318732    0.8002989
# The -299 is the correct by exact solution as are 39.4495050 and 5.5670228, the 4th and
# 5th L-moments diverge from theoLmoms.max.ostat() because the exact solutions and not
# numerical integration of the quantile function was used for E11, E22, and E33.
# So although E44 and E55 come from expect.max.ostat() within both lmomtri() and
# theoLmoms.max.ostat(), the Lambda4 and Lambda5 are not the same because the E11, E22,
# and E33 values are different.

## Not run: 
##D # At extreme limit of Tau3 for the triangular distribution, L-moment ratio diagram
##D # shows convergence to the trajectory of the Generalized Pareto distribution.
##D "tau4tri" <- function(t3) { t3[t3 < -0.14285710 | t3 >  0.14285710] <- NA
##D    b <- 0.09012180; a <- c(0, -1.777361, 0, -17.89864, 0,  920.4924, 0, -37793.50)
##D    t4 <- b + a[2]*t3^2 + a[4]*t3^4 + a[6]*t3^6 + a[8]*t3^8; return(t4)
##D }
##D F <- seq(0,1, by=0.001)
##D lmr  <- vec2lmom(c(10,9,0.142857, tau4tri(0.142857)))
##D parA <- partri(lmr); parB <- pargpa(lmr)
##D xA <- qlmomco(F,  parA); xB <- qlmomco(F, parB); x <- sort(unique(c(xA,xB)))
##D plot(x,  pdftri(x,parA), type="l", col=8, lwd=4) # Compare Asym. Tri. to 
##D lines(x, pdfgpa(x,parB),           col=2)        # Gen. Pareto
## End(Not run)



