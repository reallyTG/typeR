library(geneplotter)


### Name: multiecdf
### Title: Multiple empirical cumulative distribution functions (ecdf) and
###   densities
### Aliases: multiecdf multiecdf.list multiecdf.formula multiecdf.matrix
###   multidensity multidensity.list multidensity.formula
###   multidensity.matrix
### Keywords: hplot

### ** Examples

  words = strsplit(packageDescription("geneplotter")$Description, " ")[[1]]
  factr = factor(sample(words, 2000, replace = TRUE))
  x = rnorm(length(factr), mean=as.integer(factr))
  
  multiecdf(x ~ factr)
  multidensity(x ~ factr)



