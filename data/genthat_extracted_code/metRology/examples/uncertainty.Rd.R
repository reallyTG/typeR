library(metRology)


### Name: uncert
### Title: Uncertainty estimation functions
### Aliases: uncert uncert.default uncert.expression uncert.function
###   uncert.formula
### Keywords: univar

### ** Examples


  expr <- expression(a+b*2+c*3+d/2)
  x <- list(a=1, b=3, c=2, d=11)
  u <- lapply(x, function(x) x/10)
  u.expr<-uncert(expr, x, u, method="NUM")
  u.expr

  #Compare with default:
  uncert(u=c(0.1, 0.3, 0.2, 1.1), c=c(1.0, 2.0, 3.0, 0.5))
  
  #... or with function method
  f <- function(a,b,c,d) a+b*2+c*3+d/2
  u.fun<-uncert(f, x, u, method="NUM")
  u.fun

  #.. or with the formula method
  u.form<-uncert(~a+b*2+c*3+d/2, x, u, method="NUM")
  u.form
  
  #An example with correlation
  u.cor<-diag(1,4)
  u.cor[3,4]<-u.cor[4,3]<-0.5
  u.formc<-uncert(~a+b*2+c*3+d/2, x, u, method="NUM", cor=u.cor)
  u.formc
  
  #A Monte Carlo example
  #See uncertMC for a less linear example
  u.formc.MC<-uncert(~a+b*2+c*3+d/2, x, u, method="MC", cor=u.cor, B=200)
  u.formc.MC



