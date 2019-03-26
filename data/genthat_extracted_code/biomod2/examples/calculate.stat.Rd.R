library(biomod2)


### Name: calculate.stat
### Title: Calculate evaluation metrics based on a misclassification table
### Aliases: calculate.stat
### Keywords: models, formula, options

### ** Examples

  a <- sample(c(0,1),100, replace=TRUE)
  b <- sample(c(0,1),100, replace=TRUE)
  
  miscTab_aa <- table(a,a)
  miscTab_ab <- table(a,b)
  
  # perfect score
  calculate.stat( miscTab_aa, stat='TSS')
  # random score
  calculate.stat( miscTab_ab, stat='TSS')
  



