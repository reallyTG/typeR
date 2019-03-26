library(corregp)


### Name: cint.corregp
### Title: Confidence Intervals for Correspondence Regression
### Aliases: cint.corregp cint

### ** Examples

## No test: 
data(HairEye)
haireye.crg <- corregp(Eye ~ Hair * Sex, data = HairEye, b = 3000)
cint(haireye.crg, parm = "y", axis = 1)
cint(haireye.crg, parm = c("Hair", "Sex"), axis = 1)
## End(No test)



