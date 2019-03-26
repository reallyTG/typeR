library(subgroup.discovery)


### Name: prim.cover
### Title: PRIM covering strategy
### Aliases: prim.cover

### ** Examples

  data(pima)
  p.cov <- prim.cover(
      class ~ .,
      data = pima,
      peeling.quantile = 0.05,
      min.support = 0.1,
      plot = TRUE,
      optimal.box = "2se"
  )

  ## No test: 
  summary(p.cov)
  plot(p.cov)
  
## End(No test)



