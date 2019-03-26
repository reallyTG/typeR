library(MixfMRI)


### Name: Plotting
### Title: Main plotting function
### Aliases: plotfclust plotfclustpv plotpv plotpvlegend
### Keywords: programming

### ** Examples

library(MixfMRI, quietly = TRUE)
set.seed(1234)
  
## No test: 
  ### Check 2d data.
  da <- pval.2d.complex
  id <- !is.na(da)
  PV.gbd <- da[id]
  hist(PV.gbd, nclass = 100, main = "p-value")
  
  ### Test 2d data.
  id.loc <- which(id, arr.ind = TRUE)
  X.gbd <- t(t(id.loc) / dim(da))
  ret <- fclust(X.gbd, PV.gbd, K = 3)
  print(ret)
  
  ### p-values of rest clusters.
  ret.lrt <- lrt(PV.gbd, ret$class, K = 3)
  print(ret.lrt)
  ret.lrt2 <- lrt2(PV.gbd, ret$class, K = 3)
  print(ret.lrt2)
  
  ### Plotting.
  par(mfrow = c(2, 2), mar = c(0, 0, 2, 0))
  plotpv(da, ret$posterior, ret$param,
         zlim = c(0.005, 0.008), main = "Mean of Beta Distribution")
  plotpv(da, ret$posterior, ret$param,
         plot.mean = FALSE, main = "p-value")
  par(mar = c(5.1, 4.1, 4.1, 2.1))
  plotpvlegend(zlim = c(0.005, 0.008), main = "Mean of Beta Distribution")
  plotpvlegend(zlim = c(0, 0.01), main = "p-value")
## End(No test)



