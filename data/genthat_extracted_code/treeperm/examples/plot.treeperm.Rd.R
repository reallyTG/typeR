library(treeperm)


### Name: plot.treeperm
### Title: Plot Permutations
### Aliases: plot.treeperm

### ** Examples

value<-c(0,190,0,0,10,0,0,0,0,0,0,110,0,0,52,0,8,0,50,0,0,137,965,110)
label<-as.factor(c(1,1,1,2,2,2,1,1,1,2,2,2,1,1,1,2,2,2,1,1,1,2,2,2))
data<-data.frame(label,value)
exact<-treeperm(value~label,frame=data,type="exact")
plot(exact,size=999)
function (x, size, ...) 
{
    ran <- GetDistribution(x, size)
    r <- hist(ran, breaks = 50, main = "Permutations estimated by Monto carlo method", 
        xlab = "F  statistics", ylab = "Frequency", col = "lightblue")
    top <- max(r$counts)
    points(x$Fstatistics, -top/150, type = "p", pch = 17, col = "red", 
        lwd = 3)
    text(x$Fstatistics, -top/50, cex = 0.65, "Observed F statistics")
  }



