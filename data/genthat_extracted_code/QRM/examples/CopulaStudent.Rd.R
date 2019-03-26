library(QRM)


### Name: CopulaStudent
### Title: Student's t Copula
### Aliases: CopulaStudent dcopula.t rcopula.t fit.tcopula
### Keywords: distribution

### ** Examples

ll <- c(0.01,0.99)
#create perspective plot for bivariate density:
BiDensPlot(func = dcopula.t, xpts = ll, ypts = ll, df = 4,
           Sigma = equicorr(2, 0.5))
S <- equicorr(d = 6, rho = 0.7)
data <- rcopula.t(2000, df = 4, Sigma = S) 
pairs(data)
## Fitting Student's Copula
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
copt2 <- fit.tcopula(Udata, method = "Kendall")



