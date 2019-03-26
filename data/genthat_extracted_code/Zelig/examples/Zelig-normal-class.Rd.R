library(Zelig)


### Name: Zelig-normal-class
### Title: Normal Regression for Continuous Dependent Variables
### Aliases: Zelig-normal-class znormal

### ** Examples

data(macro)
z.out1 <- zelig(unem ~ gdp + capmob + trade, model = "normal",
data = macro)
summary(z.out1)
x.high <- setx(z.out1, trade = quantile(macro$trade, 0.8))
x.low <- setx(z.out1, trade = quantile(macro$trade, 0.2))
s.out1 <- sim(z.out1, x = x.high, x1 = x.low)
summary(s.out1)
plot(s.out1)





