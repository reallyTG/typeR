library(binomSamSize)


### Name: ciss.wilson
### Title: Sample sizes for improved binomial confidence intervals
### Aliases: ciss.wilson ciss.wald ciss.agresticoull
### Keywords: design survey

### ** Examples


#Simple calculation at one proportion (worst case)
ciss.wald(p0=0.5,alpha=0.1,d=0.05)

#Evaluate for a grid of hypothesized proportion
p.grid <- seq(0,0.5,length=100)
cissfuns <- list(ciss.wald, ciss.wilson, ciss.agresticoull)
ns <- sapply(p.grid, function(p) {
  unlist(lapply(cissfuns, function(f) f(p, d=0.1, alpha=0.05)))
})

matplot(p.grid, t(ns),type="l",xlab=expression(p[0]),ylab="n",lwd=2)
legend(x="topleft", c("Wald", "Wilson","Agresti-Coull"), col=1:3, lty=1:3,lwd=2)




