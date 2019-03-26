library(mitml)


### Name: with.mitml.list
### Title: Evaluate an expression in a list of imputed data sets
### Aliases: with.mitml.list within.mitml.list
### Keywords: methods

### ** Examples

data(studentratings)

fml <- ReadDis + SES ~ ReadAchiev + (1|ID)
imp <- panImpute(studentratings, formula=fml, n.burn=1000, n.iter=100, m=5)

implist <- mitmlComplete(imp, print=1:5)

# * Example 1: data manipulation

# calculate and save cluster means
new1.implist <- within(implist, Means.ReadAchiev <- clusterMeans(ReadAchiev, ID))

# center variables, calculate interaction terms, ignore byproducts
new2.implist <- within(implist,{
  M.SES <- mean(SES)
  M.CognAbility <- mean(CognAbility)
  C.SES <- SES - M.SES
  C.CognAbility <- CognAbility - M.CognAbility
  SES.CognAbility <- C.SES * C.CognAbility
}, ignore=c("M.SES", "M.CognAbility"))

# * Example 2: fitting statistical models

# fit regression model
fit.lm <- with(implist, lm(ReadAchiev ~ ReadDis))

# fit multilevel model using lme4
require(lme4)
fit.lmer <- with(implist, lmer(ReadAchiev ~ ReadDis + (1|ID)))

# * Example 3: manual extraction of variance estimates
require(lme4)
fit.lmer <- with(implist, lmer(SES ~ (1|ID)))

# extract level-1 and level-2 variances
var.l1 <- sapply(fit.lmer, function(z) attr(VarCorr(z),"sc")^2)
var.l2 <- sapply(fit.lmer, function(z) VarCorr(z)$ID[1,1])

# calculate final estimate of the intraclass correlation
ICC <- mean( var.l2 / (var.l2+var.l1) )



