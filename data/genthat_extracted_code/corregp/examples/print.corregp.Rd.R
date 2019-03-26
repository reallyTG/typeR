library(corregp)


### Name: print.corregp
### Title: Printing Correspondence Regression
### Aliases: print.corregp

### ** Examples

## No test: 
data(HairEye)
haireye.crg <- corregp(Eye ~ Hair * Sex, data = HairEye, b = 3000)
haireye.crg
print(haireye.crg, nf = 3)
## End(No test)



