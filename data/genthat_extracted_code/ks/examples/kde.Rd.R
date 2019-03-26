library(ks)


### Name: kde
### Title: Kernel density estimate
### Aliases: kde predict.kde
### Keywords: smooth

### ** Examples

## positive data example
data(worldbank)
wb <- as.matrix(na.omit(worldbank[,2:3]))
wb[,2] <- wb[,2]/1000
fhat <- kde(x=wb)
fhat.trans <- kde(x=wb, adj.positive=c(0,0), positive=TRUE)
plot(fhat, xlim=c(0,20), ylim=c(0,80))
plot(fhat.trans, add=TRUE, col=2)
rect(0,0,100,100, lty=2)

## large data example on non-default grid
## 151 x 151 grid = [-5,-4.933,..,5] x [-5,-4.933,..,5]
set.seed(8192)
x <- rmvnorm.mixt(10000, mus=c(0,0), Sigmas=invvech(c(1,0.8,1)))
fhat <- kde(x=x, compute.cont=TRUE, xmin=c(-5,-5), xmax=c(5,5), bgridsize=c(151,151))
plot(fhat)

## See other examples in ? plot.kde



