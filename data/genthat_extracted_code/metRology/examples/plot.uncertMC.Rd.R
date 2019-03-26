library(metRology)


### Name: plot.uncertMC
### Title: Plot method for 'uncertMC' objects
### Aliases: plot.uncertMC
### Keywords: hplot

### ** Examples

  expr <- expression(a/(b-c))
  x <- list(a=1, b=3, c=2)
  u <- lapply(x, function(x) x/20)
  set.seed(403)
  u.invexpr<-uncertMC(expr, x, u, distrib=rep("norm", 3), B=999, keep.x=TRUE )
  par(mfrow=c(2,2))
  plot(u.invexpr, which=1:4, pch=20, method="k") 
                                # method="k" gives Kendall correlation 



