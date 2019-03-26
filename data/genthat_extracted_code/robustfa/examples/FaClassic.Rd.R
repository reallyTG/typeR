library(robustfa)


### Name: FaClassic
### Title: Classical Factor Analysis
### Aliases: FaClassic FaClassic.formula FaClassic.default
### Keywords: robust

### ** Examples


data("hbk")
hbk.x = hbk[,1:3] 

## faClassicPcaReg uses the default method
faClassicPcaReg = FaClassic(x = hbk.x, factors = 2, method = "pca",
scoresMethod = "regression"); faClassicPcaReg
summary(faClassicPcaReg)

## faClassicForPcaReg uses the formula interface
## faClassicForPcaReg = faClassicPcaReg
faClassicForPcaReg = FaClassic(~., data=as.data.frame(hbk.x), factors = 2, 
method = "pca", scoresMethod = "regression"); faClassicForPcaReg
summary(faClassicForPcaReg)




