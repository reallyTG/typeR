library(spc)


### Name: mewma.arl
### Title: Compute ARLs of MEWMA control charts
### Aliases: mewma.arl mewma.arl.f mewma.ad
### Keywords: ts

### ** Examples

# Rigdon (1995a), p. 357, Tab. 1
p <- 2
r <- 0.25
h4 <- c(8.37, 9.90, 11.89, 13.36, 14.82, 16.72)
for ( i in 1:length(h4) ) cat(paste(h4[i], "\t", round(mewma.arl(r, h4[i], p, ntype="ra")), "\n"))

r <- 0.1
h4 <- c(6.98, 8.63, 10.77, 12.37, 13.88, 15.88)
for ( i in 1:length(h4) ) cat(paste(h4[i], "\t", round(mewma.arl(r, h4[i], p, ntype="ra")), "\n"))


# Rigdon (1995b), p. 372, Tab. 1
## Not run: 
##D r <- 0.1
##D p <- 4
##D h <- 12.73
##D for ( sdelta in c(0, 0.125, 0.25, .5, 1, 2, 3) )
##D   cat(paste(sdelta, "\t",
##D       round(mewma.arl(r, h, p, delta=sdelta^2, ntype="ra", r=25), digits=2), "\n"))
##D 
##D p <- 5
##D h <- 14.56
##D for ( sdelta in c(0, 0.125, 0.25, .5, 1, 2, 3) )
##D   cat(paste(sdelta, "\t",
##D       round(mewma.arl(r, h, p, delta=sdelta^2, ntype="ra", r=25), digits=2), "\n"))
##D 
##D p <- 10
##D h <- 22.67
##D for ( sdelta in c(0, 0.125, 0.25, .5, 1, 2, 3) )
##D   cat(paste(sdelta, "\t",
##D       round(mewma.arl(r, h, p, delta=sdelta^2, ntype="ra", r=25), digits=2), "\n"))
## End(Not run)

# Runger/Prabhu (1996), p. 1704, Tab. 1
## Not run: 
##D r <- 0.1
##D p <- 4
##D H <- 12.73
##D cat(paste(0, "\t", round(mewma.arl(r, H, p, delta=0, ntype="mc", r=50), digits=2), "\n"))
##D for ( delta in c(.5, 1, 1.5, 2, 3) )
##D   cat(paste(delta, "\t",
##D       round(mewma.arl(r, H, p, delta=delta, ntype="mc", r=25), digits=2), "\n"))
##D # compare with Fortran program (MEWMA-ARLs.f90) from Molnau et al. (2001) with m1 = m2 = 25
##D # H4      P     R   DEL  ARL
##D # 12.73  4.  0.10  0.00 199.78
##D # 12.73  4.  0.10  0.50  35.05
##D # 12.73  4.  0.10  1.00  12.17
##D # 12.73  4.  0.10  1.50   7.22
##D # 12.73  4.  0.10  2.00   5.19
##D # 12.73  4.  0.10  3.00   3.42
##D 
##D p <- 20
##D H <- 37.01
##D cat(paste(0, "\t",
##D     round(mewma.arl(r, H, p, delta=0, ntype="mc", r=50), digits=2), "\n"))
##D for ( delta in c(.5, 1, 1.5, 2, 3) )
##D   cat(paste(delta, "\t",
##D       round(mewma.arl(r, H, p, delta=delta, ntype="mc", r=25), digits=2), "\n"))
##D # compare with Fortran program (MEWMA-ARLs.f90) from Molnau et al. (2001) with m1 = m2 = 25
##D # H4      P     R   DEL  ARL
##D # 37.01 20.  0.10  0.00 199.09
##D # 37.01 20.  0.10  0.50  61.62
##D # 37.01 20.  0.10  1.00  20.17
##D # 37.01 20.  0.10  1.50  11.40
##D # 37.01 20.  0.10  2.00   8.03
##D # 37.01 20.  0.10  3.00   5.18
## End(Not run)

# Knoth (2017), p. 85, Tab. 3, rows with p=3
## Not run: 
##D p <- 3
##D lambda <- 0.05
##D h4 <- mewma.crit(lambda, 200, p)
##D benchmark <- mewma.arl(lambda, h4, p, delta=1, r=50)
##D   
##D mc.arl  <- mewma.arl(lambda, h4, p, delta=1, r=25, ntype="mc")
##D ra.arl  <- mewma.arl(lambda, h4, p, delta=1, r=27, ntype="ra")
##D co.arl  <- mewma.arl(lambda, h4, p, delta=1, r=12, ntype="co2")
##D gl3.arl <- mewma.arl(lambda, h4, p, delta=1, r=30, ntype="gl3")
##D gl5.arl <- mewma.arl(lambda, h4, p, delta=1, r=25, ntype="gl5")
##D   
##D abs( benchmark - data.frame(mc.arl, ra.arl, co.arl, gl3.arl, gl5.arl) )
## End(Not run)

# Prabhu/Runger (1997), p. 13, Tab. 3
## Not run: 
##D p <- 2
##D r <- 0.1
##D H <- 8.64
##D cat(paste(0, "\t",
##D     round(mewma.ad(r, H, p, delta=0, type="cycl", ntype="mc", r=60), digits=2), "\n"))
##D for ( delta in c(.5, 1, 1.5, 2, 3) )
##D   cat(paste(delta, "\t",
##D       round(mewma.ad(r, H, p, delta=delta, type="cycl", ntype="mc", r=30), digits=2), "\n"))
##D 
##D # better accuracy
##D for ( delta in c(0, .5, 1, 1.5, 2, 3) )
##D   cat(paste(delta, "\t",
##D       round(mewma.ad(r, H, p, delta=delta^2, type="cycl", r=30), digits=2), "\n"))
## End(Not run)



