library(metRology)


### Name: uncert-class
### Title: The 'uncert' class
### Aliases: print.uncert summary.uncert uncert-class
### Keywords: classes

### ** Examples


  expr <- expression(a+b*2+c*3+d/2)
  x <- list(a=1, b=3, c=2, d=11)
  u <- lapply(x, function(x) x/10)
  u.expr<-uncert(expr, x, u, method="NUM")
  print(u.expr)




