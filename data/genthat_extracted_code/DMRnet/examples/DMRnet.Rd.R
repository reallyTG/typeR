library(DMRnet)


### Name: DMRnet
### Title: Delete or Merge Regressors net
### Aliases: DMRnet

### ** Examples

## DMRnet for linear regression
data(miete)
ytr <- miete[1:1500,1]
Xtr <- miete[1:1500,-1]
Xte <- miete[1501:2053,-1]
m1 <- DMRnet(Xtr, ytr)
print(m1)
plot(m1)
g <- gic.DMR(m1, c = 2.5)
plot(g)
coef(m1, df = g$df.min)
ypr <- predict(m1, newx = Xte, df = g$df.min)

## DMRnet for logistic regression
data(promoter)
ytr <- factor(promoter[1:80,1])
Xtr <- promoter[1:80,-1]
Xte <- promoter[81:106,-1]
m2 <- DMRnet(Xtr, ytr, family = "binomial")
print(m2)
plot(m2)
g <- gic.DMR(m2, c = 2)
plot(g)
coef(m2, df = g$df.min)
ypr <- predict(m2, newx = Xte, df = g$df.min)




