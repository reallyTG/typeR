library(Zelig)


### Name: Zelig-normal-bayes-class
### Title: Bayesian Normal Linear Regression
### Aliases: Zelig-normal-bayes-class znormalbayes

### ** Examples

data(macro)
z.out <- zelig(unem ~ gdp + capmob + trade, model = "normal.bayes", data = macro, verbose = FALSE)


data(macro)
z.out <- zelig(unem ~ gdp + capmob + trade, model = "normal.bayes",
data = macro, verbose = FALSE)

z.out$geweke.diag()
z.out$heidel.diag()
z.out$raftery.diag()
summary(z.out)

x.out <- setx(z.out)
s.out1 <- sim(z.out, x = x.out)
summary(s.out1)

x.high <- setx(z.out, trade = quantile(macro$trade, prob = 0.8))
x.low <- setx(z.out, trade = quantile(macro$trade, prob = 0.2))

s.out2 <- sim(z.out, x = x.high, x1 = x.low)
summary(s.out2)




