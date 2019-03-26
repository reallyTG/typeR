library(LSD)


### Name: fusionplot
### Title: Visualize two-dimensional data clusters
### Aliases: LSD.fusionplot fusionplot
### Keywords: cluster

### ** Examples

nr = 750
x = 1:nr/300
y = c(rnorm(nr)+sin(2*x)*3,rnorm(nr)+sin(2*x+pi/2)*3)
x = c(x,x)

labs = paste("cluster",c(rep(c(1,2),each = nr)))
colpals = c("oranges","pubu")
qcol = c("transparent","black","transparent")
fusionplot(x,y,labs,separate=FALSE,colpal=colpals,alpha=75,quartiles.col = qcol)



