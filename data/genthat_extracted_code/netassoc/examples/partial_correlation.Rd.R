library(netassoc)


### Name: partial_correlation
### Title: Partial correlation coefficients
### Aliases: partial_correlation

### ** Examples

# load highly collinear economic data time series
data(longley) 
longley_ss <- t(longley[,c(1:5,7)]) # put data in correct input format

colors <- colorRampPalette(c("red","white","blue"))(10)
pc_shrinkage <- partial_correlation(longley_ss,method="shrinkage")

image(pc_shrinkage,zlim=c(-1,1),col=colors)



