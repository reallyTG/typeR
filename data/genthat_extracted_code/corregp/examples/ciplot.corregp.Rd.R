library(corregp)


### Name: ciplot.corregp
### Title: Plotting Confidence Intervals for Correspondence Regression
### Aliases: ciplot.corregp ciplot

### ** Examples

## No test: 
data(HairEye)
haireye.crg <- corregp(Eye ~ Hair * Sex, data = HairEye, b = 3000)
ciplot(haireye.crg, parm = "y", axis = 1)
ciplot(haireye.crg, parm = c("Hair", "Sex"), axis = 1)
## End(No test)



