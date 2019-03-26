library(Zelig)


### Name: Zelig-ls-class
### Title: Least Squares Regression for Continuous Dependent Variables
### Aliases: Zelig-ls-class zls

### ** Examples

library(Zelig)
data(macro)
z.out1 <- zelig(unem ~ gdp + capmob + trade, model = "ls", data = macro,
cite = FALSE)
summary(z.out1)




