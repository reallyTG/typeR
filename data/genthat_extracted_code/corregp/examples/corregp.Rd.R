library(corregp)


### Name: corregp
### Title: Correspondence Regression
### Aliases: corregp

### ** Examples

## No test: 
data(HairEye)
haireye.crg <- corregp(Eye ~ Hair * Sex, data = HairEye, b = 3000)
haireye.crg
## End(No test)



