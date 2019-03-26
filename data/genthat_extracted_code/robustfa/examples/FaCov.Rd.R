library(robustfa)


### Name: FaCov
### Title: Robust Factor Analysis
### Aliases: FaCov FaCov.formula FaCov.default
### Keywords: robust

### ** Examples


data("hbk")
hbk.x = hbk[,1:3] 

##
## faCovPcaRegMcd is obtained from FaCov.default
##
faCovPcaRegMcd = FaCov(x = hbk.x, factors = 2, method = "pca",
scoresMethod = "regression", cov.control = CovControlMcd()); faCovPcaRegMcd

##
## In fact, it is equivalent to use FaCov.formula
## faCovForPcaRegMcd = faCovPcaRegMcd
##
faCovForPcaRegMcd = FaCov(~., data = as.data.frame(hbk.x), 
factors = 2, method = "pca", scoresMethod = "regression", 
cov.control = CovControlMcd()); faCovForPcaRegMcd




