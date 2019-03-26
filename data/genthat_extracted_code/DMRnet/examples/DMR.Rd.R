library(DMRnet)


### Name: DMR
### Title: Delete or Merge Regressors
### Aliases: DMR

### ** Examples

## DMR for linear regression
data(miete)
ytr <- miete[1:1500,1]
Xtr <- miete[1:1500,-1]
Xte <- miete[1501:2053,-1]
m1 <- DMR(Xtr, ytr)
print(m1)
plot(m1)
g <- gic.DMR(m1, c = 2.5)
plot(g)
coef(m1, df = g$df.min)
ypr <- predict(m1, newx = Xte, df = g$df.min)

## DMR for logistic regression
# notice that only part of dataset promoter was used since DMR works only if p<n, for p>n use DMRnet
data(promoter)
ytr <- factor(promoter[1:80,1])
Xtr <- promoter[1:80,2:11]
Xte <- promoter[81:106,2:11]
m2 <- DMR(Xtr, ytr, family = "binomial")
print(m2)
plot(m2)
g <- gic.DMR(m2, c = 2)
plot(g)
coef(m2, df = g$df.min)
ypr <- predict(m2, newx = Xte, df = g$df.min)




