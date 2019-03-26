library(toolmaRk)


### Name: ameslab
### Title: Toolmark profiles dataset
### Aliases: ameslab
### Keywords: datasets

### ** Examples

## Don't show: 
  data(ameslab)
  plot(ameslab$profile[[1]]$V1)
  chumbley_non_random(data.frame(ameslab$profile[[1]][1:2000,]), data.frame(ameslab$profile[[2]][1:2000,]))

  res14 <- fixed_width_no_modeling(data.frame(ameslab$profile[[1]][1:1250,]), data.frame(ameslab$profile[[4]][1:1250,]), M = 200)
  res14$dist_pval
 
## End(Don't show)
## No test: 
  data(ameslab)
  plot(ameslab$profile[[1]]$V1)
  chumbley_non_random(ameslab$profile[[1]], ameslab$profile[[2]])

  res14 <- fixed_width_no_modeling(ameslab$profile[[1]], ameslab$profile[[4]])
  res14$dist_pval
 
## End(No test)



