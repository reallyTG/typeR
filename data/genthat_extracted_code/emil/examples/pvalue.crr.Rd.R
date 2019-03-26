library(emil)


### Name: pvalue.crr
### Title: Extracts p-value from a competing risk model
### Aliases: pvalue.crr

### ** Examples

if(requireNamespace("cmprsk", quitely = TRUE)){

  time <- 1:20
  event <- c(rep(0, 9), rep(2, 3), rep(1, 8))
  data <- rep(0:1, each=10)
  x <- cmprsk::crr(time, event, data)

  # Compare p-values of implementations
  print(x)
  pvalue(x)

}



