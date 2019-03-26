library(predict3d)


### Name: restoreData2
### Title: restore data column with I() function
### Aliases: restoreData2

### ** Examples

fit=lm(mpg~I(cyl^(1/2))*am,data=mtcars)
restoreData2(fit$model)
fit=lm(mpg~sqrt(hp)*log(wt)*am,data=mtcars)
restoreData2(fit$model)



