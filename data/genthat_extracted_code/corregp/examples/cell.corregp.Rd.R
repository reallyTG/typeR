library(corregp)


### Name: cell.corregp
### Title: Confidence Ellipses for Correspondence Regression
### Aliases: cell.corregp cell

### ** Examples

## No test: 
data(HairEye)
haireye.crg <- corregp(Eye ~ Hair * Sex, data = HairEye, b = 3000)
cell(haireye.crg, parm = "y")
cell(haireye.crg, parm = c("Hair", "Sex"))
## End(No test)



