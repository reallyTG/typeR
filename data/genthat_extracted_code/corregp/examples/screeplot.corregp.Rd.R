library(corregp)


### Name: screeplot.corregp
### Title: Scree Plotting
### Aliases: screeplot.corregp

### ** Examples

## No test: 
data(HairEye)
haireye.crg <- corregp(Eye ~ Hair * Sex, data = HairEye, b = 3000)
screeplot(haireye.crg, add_ci = TRUE)
## End(No test)



