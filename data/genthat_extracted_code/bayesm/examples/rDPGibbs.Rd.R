library(bayesm)


### Name: rDPGibbs
### Title: Density Estimation with Dirichlet Process Prior and Normal Base
### Aliases: rDPGibbs
### Keywords: multivariate

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {R=2000} else {R=10}
set.seed(66)

## simulate univariate data from Chi-Sq

N = 200
chisqdf = 8
y1 = as.matrix(rchisq(N,df=chisqdf))

## set arguments for rDPGibbs

Data1 = list(y=y1)
Prioralpha = list(Istarmin=1, Istarmax=10, power=0.8)
Prior1 = list(Prioralpha=Prioralpha)
Mcmc = list(R=R, keep=1, maxuniq=200)

out1 = rDPGibbs(Prior=Prior1, Data=Data1, Mcmc=Mcmc)

if(0){
  ## plotting examples
  rgi = c(0,20)
  grid = matrix(seq(from=rgi[1],to=rgi[2],length.out=50), ncol=1)
  deltax = (rgi[2]-rgi[1]) / nrow(grid)
  plot(out1$nmix, Grid=grid, Data=y1)
  
  ## plot true density with historgram
  plot(range(grid[,1]), 1.5*range(dchisq(grid[,1],df=chisqdf)),
       type="n", xlab=paste("Chisq ; ",N," obs",sep=""), ylab="")
  hist(y1, xlim=rgi, freq=FALSE, col="yellow", breaks=20, add=TRUE)
  lines(grid[,1], dchisq(grid[,1],df=chisqdf) / (sum(dchisq(grid[,1],df=chisqdf))*deltax),
        col="blue", lwd=2)
}

## simulate bivariate data from the  "Banana" distribution (Meng and Barnard) 

banana = function(A, B, C1, C2, N, keep=10, init=10) { 
  R = init*keep + N*keep
  x1 = x2 = 0
  bimat = matrix(double(2*N), ncol=2)
  for (r in 1:R) { 
    x1 = rnorm(1,mean=(B*x2+C1) / (A*(x2^2)+1), sd=sqrt(1/(A*(x2^2)+1)))
    x2 = rnorm(1,mean=(B*x2+C2) / (A*(x1^2)+1), sd=sqrt(1/(A*(x1^2)+1)))
    if (r>init*keep && r%%keep==0) {
      mkeep = r/keep
      bimat[mkeep-init,] = c(x1,x2)
    } 
  }
  return(bimat)
}

set.seed(66)
nvar2 = 2
A = 0.5
B = 0
C1 = C2 = 3
y2 = banana(A=A, B=B, C1=C1, C2=C2, 1000)

Data2 = list(y=y2)
Prioralpha = list(Istarmin=1, Istarmax=10, power=0.8)
Prior2 = list(Prioralpha=Prioralpha)
Mcmc = list(R=R, keep=1, maxuniq=200)

out2 = rDPGibbs(Prior=Prior2, Data=Data2, Mcmc=Mcmc)


if(0){
  ## plotting examples
  
  rx1 = range(y2[,1])
  rx2 = range(y2[,2])
  x1 = seq(from=rx1[1], to=rx1[2], length.out=50)
  x2 = seq(from=rx2[1], to=rx2[2], length.out=50)
  grid = cbind(x1,x2)
  plot(out2$nmix, Grid=grid, Data=y2)
  
  ## plot true bivariate density
  tden = matrix(double(50*50), ncol=50)
  for (i in 1:50) { 
  for (j in 1:50) {
        tden[i,j] = exp(-0.5*(A*(x1[i]^2)*(x2[j]^2) + 
                    (x1[i]^2) + (x2[j]^2) - 2*B*x1[i]*x2[j] - 
                    2*C1*x1[i] - 2*C2*x2[j]))
  }}
  tden = tden / sum(tden)
  image(x1, x2, tden, col=terrain.colors(100), xlab="", ylab="")
  contour(x1, x2, tden, add=TRUE, drawlabels=FALSE)
  title("True Density")
}



