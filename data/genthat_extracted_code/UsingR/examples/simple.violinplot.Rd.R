library(UsingR)


### Name: simple.violinplot
### Title: Plots violinplots instead of boxplots
### Aliases: simple.violinplot simple.violinplot.formula
###   simple.violinplot.default vlnplt
### Keywords: multivariate

### ** Examples

## make a "violin"
x <- rnorm(100) ;x[101:150] <- rnorm(50,5)
simple.violinplot(x,col="brown")
f<-factor(rep(1:5,30))
## make a quintet. Note also choice of bandwidth
simple.violinplot(x~f,col="brown",bw="SJ")






