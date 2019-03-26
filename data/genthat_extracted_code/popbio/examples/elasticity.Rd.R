library(popbio)


### Name: elasticity
### Title: Elasticity analysis of a projection matrix
### Aliases: elasticity
### Keywords: survey

### ** Examples

data(teasel)
elas<-elasticity(teasel)
image2(elas, mar=c(1,3.5,5,1) )
 title("Teasel elasticity matrix", line=2.5)
# Summed elasticities for teasel.  
# fertility in last column, stasis P on diagonal, and growth in bottom-left triangle
c(F=sum(elas[,6]), P=sum(diag(elas)), G=sum(elas[row(elas)>col(elas)]))

data(tortoise)
elas<-elasticity(tortoise[["med.high"]])
image2(elas, mar=c(1,3.5,5,1),  log=FALSE)
 title("Tortoise elasticity matrix", line=2.5)
# Summed elasticities for tortoise (see example 9.4)
# fertility in top row, stasis on diagonal, and growth on subdiagonal
c(F=sum(elas[1,]), P=sum(diag(elas)), G=sum(elas[row(elas)==col(elas)+1]))




