library(circlize)


### Name: circos.initialize
### Title: Initialize the circular layout
### Aliases: circos.initialize

### ** Examples

circos.initialize(factors = sample(letters[1:4], 20, replace = TRUE), xlim = c(0, 1))
circos.info()
circos.clear()

circos.initialize(factors = sample(letters[1:4], 20, replace = TRUE), xlim = cbind(1:4, 1:4*2))
circos.info()
circos.clear()

circos.initialize(factors = sample(letters[1:4], 20, replace = TRUE), x = rnorm(20))
circos.info()
circos.clear()




