library(corregp)


### Name: print.anova.corregp
### Title: Printing the ANOVA Table of Correspondence Regression
### Aliases: print.anova.corregp

### ** Examples

## No test: 
data(HairEye)
haireye.crg <- corregp(Eye ~ Hair * Sex, data = HairEye, b = 3000)
anova(haireye.crg, nf = 2)
## End(No test)



