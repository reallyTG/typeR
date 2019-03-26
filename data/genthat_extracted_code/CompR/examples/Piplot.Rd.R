library(CompR)


### Name: Piplot
### Title: Graphical representation of the Bradley's scores
### Aliases: Piplot

### ** Examples

  data(Cocktail_Cum)
  res<-C_piBTL(Cocktail_Cum,Constraint=0,eps1=0.0001,Pi=NULL,TestPi=TRUE)
  Res_Pi<-res$Pi
  Res_Varcov<-res$VarcovPi
  Res_Sigma<-sqrt(diag(Res_Varcov))
  Piplot(Res_Pi, SigmaPi = Res_Sigma, level=0.01, main = NULL, ylab = "Bradley's scores",
  xlab = "Item", labelprod = NULL)
  
  



