library(facilitation)


### Name: abundance.matrix
### Title: abundance matrix
### Aliases: abundance.matrix

### ** Examples

data(malthusian)
times <- seq(0,malthusian$maxtime,by=0.1)
ab <- abundance.matrix(malthusian,times)

ab.by.age <- abundance.matrix(malthusian,times,by.age=TRUE)




