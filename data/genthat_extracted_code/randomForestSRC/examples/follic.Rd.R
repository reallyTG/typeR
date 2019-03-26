library(randomForestSRC)


### Name: follic
### Title: Follicular Cell Lymphoma
### Aliases: follic
### Keywords: datasets

### ** Examples

## No test: 
data(follic, package = "randomForestSRC")
follic.obj <- rfsrc(Surv(time, status) ~ ., follic, nsplit = 3, ntree = 100)
## End(No test)



