library(metRology)


### Name: plot.uncert
### Title: Plot method for 'uncert' objects
### Aliases: plot.uncert
### Keywords: hplot

### ** Examples

  
  #An example with negative correlation
  x <- list(a=1, b=3, c=2, d=11)
  u <- lapply(x, function(x) x/10)
  u.cor<-diag(1,4)
  u.cor[3,4]<-u.cor[4,3]<- -0.5
  u.form.c<-uncert(~a+b*2+c*3+d/2, x, u, method="NUM", cor=u.cor)
  
  par(mfrow=c(3,2))
  plot(u.form.c, which=1:6, las=1, horiz=TRUE)  #Note use of barplot parameters




