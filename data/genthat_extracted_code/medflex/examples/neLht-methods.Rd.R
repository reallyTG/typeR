library(medflex)


### Name: neLht-methods
### Title: Methods for linear hypotheses in natural effect models
### Aliases: neLht-methods confint.neLhtBoot confint.neLht summary.neLht

### ** Examples

data(UPBdata)

impData <- neImpute(UPB ~ att * negaff + gender + educ + age, 
                    family = binomial, data = UPBdata)
neMod <- neModel(UPB ~ att0 * att1 + gender + educ + age, 
                 family = binomial, expData = impData, se = "robust")

lht <- neLht(neMod, linfct = c("att0 = 0", "att0 + att0:att1 = 0", 
                               "att1 = 0", "att1 + att0:att1 = 0", 
                               "att0 + att1 + att0:att1 = 0"))

## obtain confidence intervals
confint(lht)
confint(lht, parm = c("att0", "att0 + att0:att1"))
confint(lht, parm = 1:2, level = 0.90)

## summary table
summary(lht)

## summary table with omnibus Chisquare test
summary(lht, test = Chisqtest())



