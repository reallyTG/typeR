library(agridat)


### Name: vargas.wheat2
### Title: Multi-environment trial of wheat with environmental covariates
### Aliases: vargas.wheat2 vargas.wheat2.covs vargas.wheat2.yield

### ** Examples


if(require(pls) & require(reshape2)){
  
  data(vargas.wheat2.covs)
  datc <- vargas.wheat2.covs

  data(vargas.wheat2.yield)
  daty <- vargas.wheat2.yield

  # Cast to matrix
  daty <- acast(daty, env ~ gen, value.var='yield')
  rownames(datc) <- datc$env
  datc$env <- NULL
  
  # The pls package centers, but does not (by default) use scaled covariates
  # Vargas says you should
  # daty <- scale(daty)
  datc <- scale(datc)

  m2 <- plsr(daty ~ datc)

  # Plot predicted vs observed for each genotype using all components
  plot(m2)

  # Loadings
  # plot(m2, "loadings", xaxt='n')
  # axis(1, at=1:ncol(datc), labels=colnames(datc), las=2)

  # Biplots
  biplot(m2, cex=.5, which="y", var.axes=TRUE,
         main="vargas.wheat2 - daty ~ datc") # Vargas figure 2a
  biplot(m2, cex=.5, which="x", var.axes=TRUE) # Vectors form figure 2 b
  # biplot(m2, cex=.5, which="scores", var.axes=TRUE)
  # biplot(m2, cex=.5, which="loadings", var.axes=TRUE)
}




