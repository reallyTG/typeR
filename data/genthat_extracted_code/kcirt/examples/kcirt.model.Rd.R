library(kcirt)


### Name: kcirt.model
### Title: Create k-Cube Thurstonian IRT Model
### Aliases: kcirt.model
### Keywords: ~kwd1 ~kwd2

### ** Examples

constructMap.ls <- list(
c(1,2),
c(2,3),
c(1,3)
)

qTypes <- rep("R", length(constructMap.ls))

mod <- kcirt.model(constructMap.ls=constructMap.ls, qTypes=qTypes, mxLambda=NULL)

## view contents
mod



