library(FSelector)


### Name: cfs
### Title: CFS filter
### Aliases: cfs

### ** Examples

  data(iris)
  
  subset <- cfs(Species~., iris)
  f <- as.simple.formula(subset, "Species")
  print(f)



