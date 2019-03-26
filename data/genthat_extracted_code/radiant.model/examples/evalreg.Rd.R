library(radiant.model)


### Name: evalreg
### Title: Evaluate the performance of different regression models
### Aliases: evalreg

### ** Examples

data.frame(price = diamonds$price, pred1 = rnorm(3000), pred2 = diamonds$price) %>%
  evalreg(pred = c("pred1", "pred2"), "price") %>%
  str()




