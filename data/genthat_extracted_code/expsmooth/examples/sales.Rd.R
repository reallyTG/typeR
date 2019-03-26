library(expsmooth)


### Name: msales
### Title: Monthly product sales
### Aliases: msales
### Keywords: datasets

### ** Examples

plot(msales[,1],main="Monthly sales of a product",ylab="Sales",xlab="Year")
points(msales,pch=(msales[,"stockouts"]==1)+1)
legend("bottomright",pch=1:2,legend=c("Excess stock","Stock shortage"))



