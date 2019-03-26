library(subgroup.discovery)


### Name: prim.diversify
### Title: PRIM diversify strategy
### Aliases: prim.diversify

### ** Examples

  data(ames)
  p.div <- prim.diversify(
      SalePrice ~ . - PID - Order,
      data = ames,
      n = 3,
      plot = TRUE,
      parallel = FALSE,
      optimal.box = "best"
  )

  ## No test: 
  summary(p.div)
  plot(p.div)
  
## End(No test)



