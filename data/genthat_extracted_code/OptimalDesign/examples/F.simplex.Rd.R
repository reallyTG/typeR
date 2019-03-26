library(OptimalDesign)


### Name: F.simplex
### Title: Model matrix on a simplex
### Aliases: F.simplex

### ** Examples

  # The matrix of regressors for the Scheffe quadratic mixture model 
  # with 3 mixture components, each with levels {0, 0.25, 0.5, 0.75, 1}.
  F.simplex(~x1 + x2 + x3 + I(x1*x2) + I(x1*x3) + I(x2*x3) - 1, 3, 5)
  
  # The matrix of regressors for a "special cubic" model with 3 mixture 
  # components, each with levels {0, 0.2, 0.4, 0.6, 0.8, 1}.
  F.simplex(~x1 + x2 + x3 + I(x1*x2) + I(x1*x3) + I(x2*x3) + 
            I(x1*x2*x3) - 1, 3, 6)
  
  # Note that one must be careful when choosing a model for a mixture 
  # experiment: Let us compute the matrix of regressors of the simple 
  # linear mixture model with 4 mixture components, each with levels 
  # {0, 0.5, 1}.
  F1 <- F.simplex(~x1 + x2 + x3 + x4, 4, 3)
  
  # The model has only 4 parameters and as many as 10 design points, 
  # but there is no design that guarantees estimability of the 
  # parameters. This can be shown by evaluating:
  det(od.infmat(F1, rep(1, 10)))



