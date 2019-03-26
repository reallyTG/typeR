library(predict3d)


### Name: restoreData
### Title: Restore factors in data.frame as numeric
### Aliases: restoreData

### ** Examples

fit=lm(mpg~factor(cyl)*factor(am),data=mtcars)
fit=lm(mpg~wt*factor(am),data=mtcars)
fit=lm(mpg~wt*hp,data=mtcars)
restoreData(fit$model)



