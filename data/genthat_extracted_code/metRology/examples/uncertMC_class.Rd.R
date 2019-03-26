library(metRology)


### Name: uncertMC-class
### Title: The 'uncertMC' class
### Aliases: uncertMC-class print.uncertMC summary.uncertMC
### Keywords: classes

### ** Examples


  set.seed(13*17)
  expr <- expression(a+b*2+c*3+d/2)
  x <- list(a=1, b=3, c=2, d=11)
  u <- lapply(x, function(x) x/10)
  u.expr<-uncertMC(expr, x, u, distrib=rep("norm", 4), method="MC")
  print(u.expr)




