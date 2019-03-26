library(radiant.model)


### Name: plot.evalreg
### Title: Plot method for the evalreg function
### Aliases: plot.evalreg

### ** Examples

data.frame(price = diamonds$price, pred1 = rnorm(3000), pred2 = diamonds$price) %>%
  evalreg(pred = c("pred1", "pred2"), "price") %>%
  plot()




