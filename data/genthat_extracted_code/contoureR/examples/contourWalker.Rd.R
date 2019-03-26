library(contoureR)


### Name: contourWalker
### Title: Contour Walker Function, Rcpp Interface to C++ Routine
### Aliases: contourWalker

### ** Examples

n = 100
x = runif(n)
y = runif(n)
df = expand.grid(x,y);
colnames(df) = c("x","y")
df$z = df$x^2 + df$y^2
dm  = getDelaunayMesh(df$x,df$y)
res = contourWalker(dm,as.matrix(df),levels=pretty(df$z,n=20))
res = data.frame(res); colnames(res) = c('LID','GID','PID','x','y','z')
res$Group = interaction(res$LID,res$GID)
library(ggplot2)
ggplot(res,aes(x,y,group=Group,colour=z)) + geom_path()



