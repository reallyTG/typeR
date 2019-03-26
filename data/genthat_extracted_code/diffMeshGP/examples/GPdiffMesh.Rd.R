library(diffMeshGP)


### Name: GPdiffMesh
### Title: Multi-Fidelity Computer Experiments Using The Tuo-Wu-Yu Model
### Aliases: GPdiffMesh

### ** Examples

hig02 <- function(s)
{
  #The test function is from [2].
  y <- s*sin(s) / 10
  return(y)
}
myX <- matrix(c(seq(from = 0,to = 10, by = 1),
    seq(from = 0,to = 10, by = 1)),ncol = 2)
myy <- hig02(matrix(myX[,1]))
myT <- matrix(c(0.01,0.5,0.01,0.02,0.02,0.01,0.01,0.02,0.002,
    0.003,0.03))
myregf <- function(x){
  return(x)
}
myregfn <- function(s){
  return(cbind((matrix(s[,1])^2*matrix(s[,2])),
    (matrix(s[,1])*matrix(s[,2]))))
}
#Here s=cbind(t,x), where x is a matrix of input variables and
#     t is the corresponding mesh density matrix.
x <- matrix(c(seq(from = 0,to = 10, by = 0.1),
    seq(from = 0,to = 10, by = 0.1)),ncol = 2)
myploty <- hig02(matrix(x[,1]))
y <- GPdiffMesh(x, myX, myT, myy, regFunX = myregf, regFunT = myregfn)
# The regression function is beta_0 + beta_1 x + (t^2x, tx)' beta_2
y$outy
y$sigy
y$estipar
plot(x[,1], myploty,"l")
lines(x[,1],y$outy, type="o", pch=22, lty=2, col="red")



