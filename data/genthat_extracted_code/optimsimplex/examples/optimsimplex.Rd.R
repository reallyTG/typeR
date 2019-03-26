library(optimsimplex)


### Name: optimsimplex
### Title: S3 optimsimplex class
### Aliases: optimsimplex print.optimsimplex is.optimsimplex
###   optimsimplex.tostring
### Keywords: method

### ** Examples

  myfun <- function(x,this){return(list(f=sum(x^2),this=this))}
  mat <- matrix(c(0,1,0,0,0,1),ncol=2)
  
  optimsimplex()
  optimsimplex(coords=mat,x0=1:4,fun=myfun)
  optimsimplex(method='axes',x0=1:4,fun=myfun)
  optimsimplex(method='pfeffer',x0=1:6,fun=myfun)
  opt <- optimsimplex(method='randbounds',x0=1:6,boundsmin=rep(0,6),
                          boundsmax=rep(10,6),fun=myfun)
  opt
  optimsimplex(method='spendley',x0=1:6,fun=myfun,len=10)
  optimsimplex(method='oriented',simplex=opt$newobj,fun=myfun)
 



