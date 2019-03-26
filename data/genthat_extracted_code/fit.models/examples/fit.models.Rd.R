library(fit.models)


### Name: fit.models
### Title: Fit dot Models
### Aliases: fit.models
### Keywords: models

### ** Examples

  # First, use fit.models to fit robust and least squares linear
  # regression models to Brownlee's Stack Loss Plant Data.

  # Step 1: rlm (robust linear model) is in the MASS package.
  library(MASS)

  # Step 2: tell fit.models rlm can be compared to lm
  fmclass.add.class("lmfm", "rlm")

  fm1 <- fit.models(c("rlm", "lm"), stack.loss ~ ., data = stackloss)

  summary(fm1) #rlm does not provide p-values or Multiple R-squared


  # Second, use fit.models to combine fitted models into a
  # fit.models object.

  lm.complete <- lm(stack.loss ~ ., data = stackloss)
  lm.clean <- lm(stack.loss ~ ., data = stackloss, subset = 5:20)

  fm2 <- fit.models(lm.clean, lm.complete)

  summary(fm2)
  plot(fm2)


  # Name the models in the fit.models object.
  
  fm3 <- fit.models(c(Robust = "rlm", "Least Squares" = "lm"),
                    stack.loss ~ ., data = stackloss)

  fm4 <- fit.models(Clean = lm.clean, Complete = lm.complete)



