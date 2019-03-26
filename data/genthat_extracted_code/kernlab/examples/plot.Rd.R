library(kernlab)


### Name: plot
### Title: plot method for support vector object
### Aliases: plot.ksvm plot,ksvm,missing-method plot,ksvm-method
### Keywords: methods regression classif

### ** Examples

## Demo of the plot function
x <- rbind(matrix(rnorm(120),,2),matrix(rnorm(120,mean=3),,2))
y <- matrix(c(rep(1,60),rep(-1,60)))

svp <- ksvm(x,y,type="C-svc")
plot(svp,data=x)




