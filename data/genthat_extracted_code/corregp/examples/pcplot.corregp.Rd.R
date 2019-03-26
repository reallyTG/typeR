library(corregp)


### Name: pcplot.corregp
### Title: Parallel Coordinate Plotting for Correspondence Regression
### Aliases: pcplot.corregp pcplot

### ** Examples

## No test: 
data(HairEye)
haireye.crg <- corregp(Eye ~ Hair * Sex, data = HairEye, b = 3000)
pcplot(haireye.crg, parm = "y", axes = 1:3)
pcplot(haireye.crg, parm = c("Hair", "Sex"), axes = 1:3)
## End(No test)



