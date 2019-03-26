library(mitml)


### Name: summary.mitml
### Title: Summary measures for imputation models
### Aliases: summary.mitml
### Keywords: methods

### ** Examples

data(studentratings)

fml <- ReadDis + SES ~ ReadAchiev + (1|ID)
imp <- panImpute(studentratings, formula=fml, n.burn=1000, n.iter=100, m=5)

# print summary
summary(imp)



