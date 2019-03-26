library(LPS)


### Name: predict.LPS
### Title: Predict method for LPS objects
### Aliases: predict.LPS

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
  
  
  # Class prediction plot
  predict(m, expr, plot=TRUE)
  
  # Wright et al. class prediction
  table(
    group,
    prediction = predict(m, expr),
    exclude = NULL
  )
  
  # More stringent threshold
  table(
    group,
    prediction = predict(m, expr, threshold=0.99),
    exclude = NULL
  )
  
  # Radmacher et al. class prediction
  table(
    group,
    prediction = predict(m, expr, method="Radmacher"),
    exclude = NULL
  )
  
  # Probabilities
  predict(m, expr, type="probability", method="Wright")
  predict(m, expr, type="probability", method="Radmacher")
  predict(m, expr, type="probability", method="exact")
  
  # Probability plot
  predict(m, expr, type="probability", plot=TRUE)
  
  # Annotated probability plot
  side <- data.frame(group, row.names=rownames(expr))
  predict(m, expr, side=side, type="probability", plot=TRUE)
  
  # Score plot
  predict(m, expr, type="score", plot=TRUE)



