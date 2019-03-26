library(QRM)


### Name: Gauss
### Title: Multivariate Gauss Distribution
### Aliases: Gauss dmnorm rmnorm fit.norm MardiaTest jointnormalTest
### Keywords: distribution

### ** Examples

BiDensPlot(func = dmnorm, mu = c(0, 0), Sigma = equicorr(2, -0.7))
S <- equicorr(d = 3, rho = 0.7)
data <- rmnorm(1000, Sigma = S)
fit.norm(data)
S <- equicorr(d = 10, rho = 0.6)
data <- rmnorm(1000, Sigma = S) 
MardiaTest(data)
## Dow Jones Data
data(DJ)
r <- returns(DJ) 
stocks <- c("AXP","EK","BA","C","KO","MSFT",
            "HWP","INTC","JPM","DIS")
ss <- window(r[, stocks], "1993-01-01", "2000-12-31")
jointnormalTest(ss) 



