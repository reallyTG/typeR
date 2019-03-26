library(bcRep)


### Name: vgenes
### Title: VH gene usage data
### Aliases: vgenes
### Keywords: datasets

### ** Examples

data(vgenes)
str(vgenes)
barplot(t(vgenes), col = rainbow(n = ncol(vgenes),start=0.2, end = 0.9), 
     xlim = c(0, nrow(vgenes)+5), ylab="proportion", 
     main="VH gene usage", las=3)
legend("right",col = rainbow(n = ncol(vgenes)), colnames(vgenes), pch=15)



