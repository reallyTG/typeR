library(spatstat)


### Name: PPversion
### Title: Transform a Function into its P-P or Q-Q Version
### Aliases: PPversion QQversion
### Keywords: spatial nonparametric manip

### ** Examples

  opa <- par(mar=0.1+c(5,5,4,2))
  G <- Gest(redwoodfull)
  plot(PPversion(G))
  plot(QQversion(G))
  par(opa)



