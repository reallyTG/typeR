library(corregp)


### Name: plot3d.corregp
### Title: 3D Plotting for Correspondence Regression
### Aliases: plot3d.corregp

### ** Examples

## No test: 
data(HairEye)
haireye.crg <- corregp(Eye ~ Hair * Sex, data = HairEye, b = 3000)
plot3d(haireye.crg, x_ell = TRUE, xsub = c("Hair", "Sex"))
## End(No test)



