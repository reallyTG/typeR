library(ecespa)


### Name: Kmm
### Title: Mark-weighted K-function
### Aliases: Kmm plot.ecespa.kmm print.ecespa.kmm ecespa.kmm
### Keywords: spatial

### ** Examples


  ## Figure 3.10 of De la Cruz (2008):
  # change r to r=1:100
  
   r = seq(1,100, by=5)
  
  data(seedlings1)
  
  data(seedlings2)
  
  s1km <- Kmm(seedlings1, r=r)
  
  s2km <- Kmm(seedlings2, r=r)
  
  plot(s1km, ylime=c(0.6,1.2), lwd=2, maine="", xlabe="r(cm)")

  plot(s2km,  lwd=2, lty=2, add=TRUE )

  abline(h=1, lwd=2, lty=3)
  
  legend(x=60, y=1.2, legend=c("Hs_C1", "Hs_C2", "H0"),
	 lty=c(1, 2, 3), lwd=c(3, 2, 2), bty="n")
## Not run: 
##D ## A pointwise test of normalized Kmm == 1 for seedlings1:
##D 
##D    s1km.test <- Kmm(seedlings1, r=1:100, nsim=99)
##D 
##D    plot(s1km.test,  xlabe="r(cm)")
##D 
##D   
## End(Not run)



