library(robustfa)


### Name: myFaPrint
### Title: Show/Print/Display an Object
### Aliases: myFaPrint
### Keywords: robust

### ** Examples


data("hbk")
hbk.x = hbk[,1:3] 

faCovPcaRegMcd = FaCov(x = hbk.x, factors = 2, method = "pca",
scoresMethod = "regression", cov.control = CovControlMcd())

## object=show(object)=print(object)=myFaPrint(object)
## faCovPcaRegMcd is an object of class "Fa"
faCovPcaRegMcd
show(faCovPcaRegMcd)
print(faCovPcaRegMcd)
myFaPrint(faCovPcaRegMcd)




