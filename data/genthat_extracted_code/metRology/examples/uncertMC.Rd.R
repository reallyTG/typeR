library(metRology)


### Name: uncertMC
### Title: Monte Carlo evaluation of measurement uncertainty.
### Aliases: uncertMC
### Keywords: univar

### ** Examples


  expr <- expression(a+b*2+c*3+d/2)
  x <- list(a=1, b=3, c=2, d=11)
  u <- lapply(x, function(x) x/10)
  u.MC<-uncertMC(expr, x, u, distrib=rep("norm", 4), method="MC")
  print(u.MC, simplify=FALSE)

  #An example with correlation
  u.cor<-diag(1,4)
  u.cor[3,4]<-u.cor[4,3]<-0.5
  u.formc.MC<-uncertMC(~a+b*2+c*3+d/2, x, u, cor=u.cor, keep.x=TRUE)
  u.formc.MC

  #A non-linear example
  expr <- expression(a/(b-c))
  x <- list(a=1, b=3, c=2)
  u <- lapply(x, function(x) x/20)
  set.seed(403)
  u.invexpr<-uncertMC(expr, x, u, distrib=rep("norm", 3), B=999, keep.x=TRUE )
  u.invexpr

  #Look at effect of vectorize
  system.time(uncertMC(expr, x, u, distrib=rep("norm", 3), B=9999, keep.x=TRUE ))
  system.time(uncertMC(expr, x, u, distrib=rep("norm", 3), B=9999, keep.x=TRUE, vectorize=FALSE))
  



