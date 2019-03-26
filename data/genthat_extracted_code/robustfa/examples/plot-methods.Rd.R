library(robustfa)


### Name: plot-methods
### Title: Plot an object of class "Fa"
### Aliases: plot-methods plot,Fa,missing-method plot,Fa-method
### Keywords: methods

### ** Examples


data("hbk")
hbk.x = hbk[,1:3] 

faClassicPcaReg = FaClassic(x = hbk.x, factors = 2, method = "pca",
scoresMethod = "regression"); faClassicPcaReg
summary(faClassicPcaReg)

plot(faClassicPcaReg, which = "factorScore", choices = 1:2)
plot(faClassicPcaReg, which = "screeplot")




