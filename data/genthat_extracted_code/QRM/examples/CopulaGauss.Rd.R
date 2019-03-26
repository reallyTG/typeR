library(QRM)


### Name: CopulaGauss
### Title: Gauss Copula
### Aliases: dcopula.gauss rcopula.gauss fit.gausscopula
### Keywords: distribution

### ** Examples

ll <- c(0.01,0.99)
BiDensPlot(func = dcopula.gauss, xpts = ll, ypts = ll,
           Sigma = equicorr(2, 0.5))
data <- rcopula.gauss(2000, Sigma = equicorr(d = 6, rho = 0.7)) 
pairs(data)
## Fitting Gauss Copula
data(smi)
data(ftse100)
s1 <- window(ftse100, "1990-11-09", "2004-03-25")
s1a <- alignDailySeries(s1)
s2a <- alignDailySeries(smi)
idx <- merge(s1a, s2a)
r <-returns(idx)
rp <- series(window(r, "1994-01-01", "2003-12-31"))
rp <- rp[(rp[, 1] != 0) & (rp[, 2] !=0), ]
Udata <- apply(rp, 2, edf, adjust = 1)
copgauss <- fit.gausscopula(Udata) 



