library(airGR)


### Name: TransfoParam_CemaNeige
### Title: Transformation of the parameters of the CemaNeige module
### Aliases: TransfoParam_CemaNeige

### ** Examples

library(airGR)

## transformation Raw -> Transformed for the CemaNeige module
Xraw  <- matrix(c(+0.19, +1.73,
                  +0.39, +2.51,
                  +0.74, +4.06),
                  ncol = 2, byrow = TRUE)
Xtran <- TransfoParam_CemaNeige(ParamIn = Xraw , Direction = "RT")

## transformation Transformed -> Raw for the CemaNeige module
Xtran <- matrix(c(-6.26, +0.55,
                  -2.13, +0.92,
                  +4.86, +1.40),
                  ncol = 2, byrow = TRUE)
Xraw  <- TransfoParam_CemaNeige(ParamIn = Xtran, Direction = "TR")



