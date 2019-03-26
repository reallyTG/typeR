library(qrsvm)


### Name: multqrsvm
### Title: Fits multiple Quantile Regression SVM
### Aliases: multqrsvm

### ** Examples

n<-200

x<-as.matrix(seq(-2,2,length.out = n))
y<-rnorm(n)*(0.3+abs(sin(x)))

plot(x,y)

models<-list()
quant<-c(0.01,0.25,0.5,0.75,0.99)
models<-multqrsvm(x,y,tau = quant, doPar=FALSE, sigma = 1)
for(i in 1:length(models)){
 lines(x, models[[i]]$fitted, col="red")
}



