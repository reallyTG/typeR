library(icdGLM)


### Name: icdglm.fit
### Title: EM by the Method of Weights for Incomplete Data in GLMs
###   (Algorithm)
### Aliases: icdglm.fit

### ** Examples

data(TLI.data)
          complete.data <- expand_data(data = TLI.data[, 1:3],
                                       y = TLI.data[, 4],
                                       missing.x = 1:3,
                                       value.set = 0:1)
          example1 <- icdglm.fit(x = complete.data$data[, 1:3],
                                 y = complete.data$data[, 4],
                                 weights = complete.data$weights,
                                 indicator = complete.data$indicator,
                                 family = binomial(link = "logit"),
                                 control = list(epsilon = 1e-10,
                                                maxit = 100, trace = TRUE))



