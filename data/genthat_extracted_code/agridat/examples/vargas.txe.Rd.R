library(agridat)


### Name: vargas.txe
### Title: Treatment x environment interaction in agronomy trials
### Aliases: vargas.txe vargas.txe.covs vargas.txe.yield
### Keywords: datasets

### ** Examples


data(vargas.txe.covs)
data(vargas.txe.yield)

if(require(reshape2)){
  
  require(lattice)
  redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
  Z <- vargas.txe.yield
  Z <- acast(Z, year ~ trt, value.var='yield')
  levelplot(Z, col.regions=redblue,
            main="vargas.txe.yield", xlab="year", ylab="treatment",
            scales=list(x=list(rot=90)))
  
  # Double-centered like AMMI
  Z <- sweep(Z, 1, rowMeans(Z))
  Z <- sweep(Z, 2, colMeans(Z))
  # Vargas figure 1
  biplot(prcomp(Z, scale.=FALSE), main="vargas.txe.yield")

  # Now, PLS relating the two matrices
  U <- vargas.txe.covs
  U <- scale(U) # Standardized covariates
  require(pls)
  m1 <- plsr(Z~U)
  # Vargas Fig 2, flipped vertical/horizontal
  biplot(m1, which="x", var.axes=TRUE)

}




