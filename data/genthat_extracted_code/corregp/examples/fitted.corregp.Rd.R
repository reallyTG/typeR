library(corregp)


### Name: fitted.corregp
### Title: Extracting Fitted Values from Correspondence Regression
### Aliases: fitted.corregp fitted.values.corregp

### ** Examples

## No test: 
data(HairEye)
haireye.crg <- corregp(Eye ~ Hair * Sex, data = HairEye, b = 3000)
fitted(haireye.crg, parm = c("Hair", "Sex"), nf = 2)
fitted.values(haireye.crg, parm = c("Hair", "Sex"), nf = 2)
## End(No test)



