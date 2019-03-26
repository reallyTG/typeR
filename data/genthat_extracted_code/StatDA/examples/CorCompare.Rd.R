library(StatDA)


### Name: CorCompare
### Title: Compares Correlation Matrices
### Aliases: CorCompare
### Keywords: univar multivariate

### ** Examples

data(chorizon)
x=chorizon[,c("Ca","Cu","Mg","Na","P","Sr","Zn")]
par(mfrow=c(1,1),mar=c(4,4,2,0))
R=robustbase::covMcd(log10(x),cor=TRUE)$cor
P=cor(log10(x))

CorCompare(R,P,labels1=dimnames(x)[[2]],labels2=dimnames(x)[[2]],
method1="Robust",method2="Pearson",ndigits=2, cex.label=1.2)




