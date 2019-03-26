library(UsingR)


### Name: violinplot
### Title: Plots violinplots instead of boxplots
### Aliases: violinplot violinplot.default violinplot.formula
### Keywords: multivariate

### ** Examples

## make a "violin"
x <- rnorm(100) ;x[101:150] <- rnorm(50,5)
violinplot(x,col="brown")
f<-factor(rep(1:5,30))
## make a quintet. Note also choice of bandwidth
violinplot(x~f,col="brown",bw="SJ")






