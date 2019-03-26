library(LPS)


### Name: LPS
### Title: Linear Predictor Score fitting
### Aliases: LPS LPS-class

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
  
  
  # 10 best features (straightforward)
  m <- LPS(data=expr, coeff=coeff, response=group, k=10)
  
  # 10 best features (formula)
  ### 'k' MUST be an integer, or will be understood as a 'threshold'
  ### Numbers are "numeric", enforce integer with "L" or "as.integer"
  m <- LPS(data=as.data.frame(expr), coeff=coeff, formula=group~10L)
  k <- as.integer(10)
  m <- LPS(data=as.data.frame(expr), coeff=coeff, formula=group~k)
  
  # FDR threshold
  thr <- 0.01
  m <- LPS(data=expr, coeff=coeff, response=group, threshold=thr)
  m <- LPS(data=as.data.frame(expr), coeff=coeff, formula=group~0.01)
  m <- LPS(data=as.data.frame(expr), coeff=coeff, formula=group~thr)
  
  # Custom model
  m <- LPS(data=expr, coeff=coeff[ c("27481","17013") ,], response=group, k=2)
  m <- LPS(data=as.data.frame(expr), coeff=coeff, formula=group~`27481`+`17013`)
  ### Notice backticks in formula for syntactically invalid names
  
  # Complete model
  m <- LPS(data=expr, coeff=coeff, response=group, k=ncol(expr))
  m <- LPS(data=expr, coeff=coeff, response=group, threshold=1)
  ### m <- LPS(data=as.data.frame(expr), coeff=coeff, formula=group~.)
  ### The last is correct but (really) slow on large datasets



