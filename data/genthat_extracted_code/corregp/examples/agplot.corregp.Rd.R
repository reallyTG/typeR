library(corregp)


### Name: agplot.corregp
### Title: Plotting an Association Graph for Correspondence Regression
### Aliases: agplot.corregp plotag.corregp agplot plotag

### ** Examples

## No test: 
data(HairEye)
haireye.crg <- corregp(Eye ~ Hair * Sex, data = HairEye, b = 3000)
agplot(haireye.crg, axes = 1:2, xsub = c("Hair", "Sex"))
plotag(haireye.crg, axes = 1:2, xsub = c("Hair", "Sex"))
## End(No test)



