library(corregp)


### Name: cell3d.corregp
### Title: 3D Confidence Ellipsoids for Correspondence Regression
### Aliases: cell3d.corregp cell3d

### ** Examples

## No test: 
data(HairEye)
haireye.crg <- corregp(Eye ~ Hair * Sex, data = HairEye, b = 3000)
cell3d(haireye.crg, parm = "y")
cell3d(haireye.crg, parm = c("Hair", "Sex"))
## End(No test)



