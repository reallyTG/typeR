library(LPS)


### Name: plot.LPS
### Title: Plot method for LPS objects
### Aliases: plot.LPS

### ** Examples

  # Data with features in columns
  data(rosenwald)
  group <- rosenwald.cli$group
  expr <- t(rosenwald.expr)
  
  # NA imputation (feature's mean to minimize impact)
  f <- function(x) { x[ is.na(x) ] <- round(mean(x, na.rm=TRUE), 3); x }
  expr <- apply(expr, 2, f)
  
  # Coefficients
  coeff <- LPS.coeff(data=expr, response=group)
  
  # 10 best features model
  m <- LPS(data=expr, coeff=coeff, response=group, k=10)
  
  
  # Distributions of scores in each group
  plot(m, "density")
  
  # Probability for each group along the score axis
  plot(m, "probability", yaxt="s")



