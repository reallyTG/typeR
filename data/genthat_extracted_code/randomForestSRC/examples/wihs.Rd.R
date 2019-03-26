library(randomForestSRC)


### Name: wihs
### Title: Women's Interagency HIV Study (WIHS)
### Aliases: wihs
### Keywords: datasets

### ** Examples

## No test: 
data(wihs, package = "randomForestSRC")
wihs.obj <- rfsrc(Surv(time, status) ~ ., wihs, nsplit = 3, ntree = 100)
## End(No test)



