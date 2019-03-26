library(radiant.model)


### Name: summary.evalreg
### Title: Summary method for the evalreg function
### Aliases: summary.evalreg

### ** Examples

data.frame(price = diamonds$price, pred1 = rnorm(3000), pred2 = diamonds$price) %>%
  evalreg(pred = c("pred1", "pred2"), "price") %>%
  summary()




