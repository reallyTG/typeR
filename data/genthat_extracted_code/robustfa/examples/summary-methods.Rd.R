library(robustfa)


### Name: summary-methods
### Title: Summary an Object
### Aliases: summary-methods summary,Fa-method summary
### Keywords: methods

### ** Examples


data("hbk")
hbk.x = hbk[,1:3] 

faCovPcaRegMcd = FaCov(x = hbk.x, factors = 2, method = "pca",
scoresMethod = "regression", cov.control = CovControlMcd()); faCovPcaRegMcd

faCovPcaRegMcd
summary(faCovPcaRegMcd)




