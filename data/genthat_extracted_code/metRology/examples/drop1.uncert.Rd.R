library(metRology)


### Name: drop1.uncert
### Title: Single variable deletions from the uncertainty budget.
### Aliases: drop1.uncert drop1.uncertMC print.drop1.uncert
###   plot.drop1.uncert
### Keywords: univar

### ** Examples

  ## Don't show: 
  #An example with negative correlation
  x <- list(a=1, b=3, c=2, d=11)
  u <- lapply(x, function(x) x/10)
  u.cor<-diag(1,4)
  u.cor[3,4]<-u.cor[4,3]<- -0.5
  u.form.c<-uncert(~a+b*2+c*3+d/2, x, u, method="NUM", cor=u.cor)
  
## End(Don't show)

  #Continuing the example from plot.uncert:
  require(graphics)
  
  d1<-drop1(u.form.c, simplify=FALSE)
  d1
  
  plot(d1)
  
  drop1(u.form.c)         #% change only
  
  




