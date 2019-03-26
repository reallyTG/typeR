library(spatstat.data)


### Name: murchison
### Title: Murchison gold deposits
### Aliases: murchison
### Keywords: datasets spatial

### ** Examples

  if(require(spatstat)) {
  if(interactive()) {
  data(murchison)
  plot(murchison$greenstone, main="Murchison data", col="lightgreen")
  plot(murchison$gold, add=TRUE, pch="+",col="blue")
  plot(murchison$faults, add=TRUE, col="red")
  }
  }



