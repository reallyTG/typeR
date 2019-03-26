library(dse)


### Name: SS
### Title: State Space Models
### Aliases: SS is.SS is.innov.SS is.nonInnov.SS
### Keywords: ts

### ** Examples

    f <- array(c(.5,.3,.2,.4),c(2,2))
    h <- array(c(1,0,0,1),c(2,2))
    k <- array(c(.5,.3,.2,.4),c(2,2))
    ss <- SS(F=f,G=NULL,H=h,K=k)
    is.SS(ss)
    ss



