library(QRM)


### Name: NH
### Title: Normal Inverse Gaussian and Hyperbolic Distribution
### Aliases: NH fit.NH fit.mNH MCECMupdate MCECM.Qfunc EMupdate
### Keywords: distribution

### ** Examples

data(DJ)
r <- returns(DJ) 
s <- window(r[, "MSFT"], "1993-01-01", "2000-12-31")
mod.NIG <- fit.NH(100 * s, method = "BFGS")
## multivariate
stocks <- c("AXP","EK","BA","C","KO","MSFT",
            "HWP","INTC","JPM","DIS")
ss <- window(r[, stocks], "1993-01-01", "2000-12-31")
fridays <- time(ss)[isWeekday(time(ss), wday = 5)]
ssw <- aggregate(ss, by = fridays, FUN = sum)
mod.mNIG <- fit.mNH(ssw, symmetric = FALSE, case = "NIG") 



