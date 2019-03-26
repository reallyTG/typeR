library(corregp)


### Name: residuals.corregp
### Title: Extracting Residuals from Correspondence Regression
### Aliases: residuals.corregp resid.corregp

### ** Examples

## No test: 
data(HairEye)
haireye.crg <- corregp(Eye ~ Hair * Sex, data = HairEye, b = 3000)
residuals(haireye.crg, parm = c("Hair", "Sex"), nf = 2)
resid(haireye.crg, parm = c("Hair", "Sex"), nf = 2)
## End(No test)



