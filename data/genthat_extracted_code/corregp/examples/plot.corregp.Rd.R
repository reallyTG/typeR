library(corregp)


### Name: plot.corregp
### Title: Plotting Correspondence Regression
### Aliases: plot.corregp

### ** Examples

## No test: 
data(HairEye)
haireye.crg <- corregp(Eye ~ Hair * Sex, data = HairEye, b = 3000)
plot(haireye.crg, x_ell = TRUE, xsub = c("Hair", "Sex"))
## End(No test)



