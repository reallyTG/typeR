library(Zelig)


### Name: Zelig-normal-gee-class
### Title: Generalized Estimating Equation for Normal Regression
### Aliases: Zelig-normal-gee-class znormalgee

### ** Examples

library(Zelig)
data(macro)
z.out <- zelig(unem ~ gdp + capmob + trade, model ="normal.gee", id = "country",
        data = macro, corstr = "AR-M")
summary(z.out)



