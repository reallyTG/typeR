library(medflex)


### Name: plot.neLht
### Title: Confidence interval plots for linear hypotheses in natural
###   effect models
### Aliases: plot.neLht plot.neEffdecomp plot.neLhtBoot

### ** Examples

data(UPBdata)

impData <- neImpute(UPB ~ att * negaff + gender + educ + age, 
                    family = binomial, data = UPBdata)
neMod <- neModel(UPB ~ att0 * att1 + gender + educ + age, 
                 family = binomial, expData = impData, se = "robust")

lht <- neLht(neMod, linfct = c("att0 = 0", "att0 + att0:att1 = 0", 
                               "att1 = 0", "att1 + att0:att1 = 0", 
                               "att0 + att1 + att0:att1 = 0"))

## all pairs return identical output
plot(confint(lht), transf = exp)
plot(lht, transf = exp)

plot(neEffdecomp(neMod), transf = exp)
plot(neMod, transf = exp)

## Don't show: 
  plot(neEffdecomp(neMod), level = 0.8, transf = exp, ylabels = c("PDE", "TDE", "PIE", "TIE", "TE"), yticks.at = c(0, 0.1, 0.5, 0.6, 1))
  plot(neMod, level = 0.8, transf = exp, ylabels = c("PDE", "TDE", "PIE", "TIE", "TE"), yticks.at = c(0, 0.1, 0.5, 0.6, 1))
  
  lht <- neLht(neMod, linfct = c("att0 = 0"))
  summary(lht)
  lht <- neLht(neMod, linfct = c("att0 = 0", "att0 + att0:att1 = 2"))
  summary(lht)
## End(Don't show)



