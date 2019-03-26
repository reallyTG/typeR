library(Benchmarking)


### Name: excess
### Title: Excess input compared over frontier input
### Aliases: excess
### Keywords: models efficiency

### ** Examples

x <- matrix(c(100,200,300,500,100,200,600),ncol=1)
y <- matrix(c(75,100,300,400,25,50,400),ncol=1)

e <- dea(x,y)
excess(e,x)
x - eff(e) * x

e <- dea(x,y, ORIENTATION="graph")
excess(e, x, y)
x - eff(e) * x
1/eff(e) * y -y

me <- mea(x,y)
excess(me)



