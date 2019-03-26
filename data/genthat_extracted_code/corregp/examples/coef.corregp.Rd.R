library(corregp)


### Name: coef.corregp
### Title: Extracting Coefficients from Correspondence Regression
### Aliases: coef.corregp coefficients.corregp

### ** Examples

## No test: 
data(HairEye)
haireye.crg <- corregp(Eye ~ Hair * Sex, data = HairEye, b = 3000)
coef(haireye.crg, parm = c("Hair", "Sex"), axes = 1:2)
coefficients(haireye.crg, parm = c("Hair", "Sex"), axes = 1:2)
## End(No test)



