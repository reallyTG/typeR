library(icdGLM)


### Name: icdglm
### Title: EM by the Method of Weights for Incomplete Data in GLMs
### Aliases: icdglm

### ** Examples

data(TLI.data)
          complete.data <- expand_data(data = TLI.data[,1:3],
                                       y = TLI.data[,4],
                                       missing.x = 1:3,
                                       value.set = 0:1)
          example <- icdglm(y ~ x1 + x2 + x3, family = binomial(link = "logit"),
                            data = complete.data$data, weights = complete.data$weights,
                            indicator = complete.data$indicator)
          summary(example)



