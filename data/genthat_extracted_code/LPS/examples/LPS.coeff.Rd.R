library(LPS)


### Name: LPS.coeff
### Title: Linear Predictor Score coefficient computation
### Aliases: LPS.coeff

### ** Examples

  # Data with features in columns
  data(rosenwald)
  group <- rosenwald.cli$group
  expr <- t(rosenwald.expr)
  
  
  # All features, all samples
  k <- LPS.coeff(data=expr, response=group)
  k <- LPS.coeff(formula=group~1, data=as.data.frame(expr))
  ### LPS.coeff(formula=group~., data=as.data.frame(expr), na.action=na.pass)
  ### The last is correct but (really) slow on large datasets
  
  # Feature subset, all samples
  k <- LPS.coeff(data=expr[, c("27481","17013") ], response=group)
  k <- LPS.coeff(formula=group~`27481`+`17013`, data=as.data.frame(expr))
  ### Notice backticks in formula for syntactically invalid names
  
  # All features, sample subset
  training <- rosenwald.cli$set == "Training"
  ### training <- sample.int(nrow(expr), 10)
  ### training <- which(rosenwald.cli$set == "Training")
  ### training <- rownames(subset(rosenwald.cli, set == "Training"))
  k <- LPS.coeff(data=expr, response=group, subset=training)
  k <- LPS.coeff(formula=group~1, data=as.data.frame(expr), subset=training)

  # NA handling by model.frame()
  k <- LPS.coeff(formula=group~1, data=as.data.frame(expr), na.action=na.omit)



