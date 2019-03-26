library(randomForestSRC)


### Name: pbc
### Title: Primary Biliary Cirrhosis (PBC) Data
### Aliases: pbc
### Keywords: datasets

### ** Examples

## No test: 
data(pbc, package = "randomForestSRC")
pbc.obj <- rfsrc(Surv(days, status) ~ ., pbc, nsplit = 3)
## End(No test)



