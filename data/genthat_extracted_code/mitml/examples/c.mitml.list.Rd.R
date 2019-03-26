library(mitml)


### Name: c.mitml.list
### Title: Concatenate lists of imputed data sets
### Aliases: c.mitml.list rbind.mitml.list cbind.mitml.list
### Keywords: methods

### ** Examples

# Example 1: manual imputation by grouping variable

data(studentratings)
fml <- ReadDis + SES ~ ReadAchiev + (1|ID)

imp <- panImpute(subset(studentratings, FedState=="SH"), formula=fml, n.burn=1000, n.iter=100, m=5)
implist <- mitmlComplete(imp, print="all")

imp2 <- panImpute(subset(studentratings, FedState=="B"), formula=fml, n.burn=1000, n.iter=100, m=5)
implist2 <- mitmlComplete(imp2, print="all")

rbind(implist, implist2)

# Example 2: predicted values from linear model

pred <- with(implist, predict(lm(ReadDis~ReadAchiev)))
cbind(implist, pred.ReadDis=pred)



