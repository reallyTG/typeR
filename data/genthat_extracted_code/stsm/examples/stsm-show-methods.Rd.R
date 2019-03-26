library(stsm)


### Name: stsm-show-methods
### Title: Display an Object of Class 'stsm'
### Aliases: stsm-show-methods show show,stsm-method
### Keywords: methods

### ** Examples

m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var1" = 2, "var2" = 15, "var3" = 30))
show(m)
# or just
m



