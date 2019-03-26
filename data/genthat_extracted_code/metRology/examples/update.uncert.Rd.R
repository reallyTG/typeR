library(metRology)


### Name: update.uncert
### Title: Update and recalculate an uncertainty estimate
### Aliases: update.uncert
### Keywords: univar

### ** Examples


  #From uncert:
  expr <- expression(a+b*2+c*3+d/2)
  x <- list(a=1, b=3, c=2, d=11)
  u <- lapply(x, function(x) x/10)
  u.expr<-uncert(expr, x, u, method="NUM")
  u.expr

  update(u.expr, u=list(a=0.3))
  
  update(u.expr, method="MC")
  



