library(kcirt)


### Name: kcirt.ystarinfo
### Title: Calculate State Information
### Aliases: kcirt.ystarinfo
### Keywords: ~kwd1 ~kwd2

### ** Examples

constructMap.ls <- list(
c(1,1,2,2),
c(1,1,3,3),
c(2,2,3,3),
c(1,1,2,2),
c(1,1,3,3),
c(2,2,3,3),
c(1,2),
c(2,3),
c(1,3)
)
    
    
qTypes <- rep("R", length(constructMap.ls))
    
mod <- kcirt.model(constructMap.ls=constructMap.ls, qTypes=qTypes, mxLambda=NULL)

mxInfo <- kcirt.ystarinfo(mod)

mxInfo

mxErrorVar <- solve(mxInfo)

mxErrorVar




