library(corregp)


### Name: anova.corregp
### Title: Building an ANOVA Table for Correspondence Regression
### Aliases: anova.corregp

### ** Examples

## No test: 
data(HairEye)
haireye.crg <- corregp(Eye ~ Hair * Sex, data = HairEye, b = 3000)
anova(haireye.crg, nf = 2)
## End(No test)



