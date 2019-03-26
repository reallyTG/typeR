library(QRM)


### Name: Student
### Title: Student's t Distribution
### Aliases: Student dmt rmt qst fit.st fit.mst
### Keywords: distribution

### ** Examples

BiDensPlot(func = dmt, xpts = c(-4, 4), ypts = c(-4, 4), mu = c(0, 0),
           Sigma = equicorr(2, -0.7), df = 4)
## Quantiles of univariate Student's t
p <- c(0.90,0.95)
s <- 0.2 * 10000/sqrt(250)
qst(p, sd = s, df = 4, scale = TRUE)
## Fitting multivariate Student's t
Sigma <- diag(c(3, 4, 5)) %*% equicorr(3, 0.6) %*% diag(c(3, 4, 5)) 
mu <- c(1, 2 ,3) 
tdata <- rmt(1000, 4, mu = mu, Sigma = Sigma) 
mod1 <- fit.mst(tdata, method = "BFGS")
## DJ data
data(DJ)
r <- returns(DJ)
s <- window(r[, "MSFT"], "1993-01-01", "2000-12-31")
mod.t1 <- fit.st(100 * s)
stocks <- c("AXP","EK","BA","C","KO","MSFT",
            "HWP","INTC","JPM","DIS")
ss <- window(r[, stocks], "1993-01-01", "2000-12-31")
fridays <- time(ss)[isWeekday(time(ss), wday = 5)]
ssw <- aggregate(ss, by = fridays, FUN = sum)
mod.t2 <- fit.mst(ssw, method = "BFGS") 



