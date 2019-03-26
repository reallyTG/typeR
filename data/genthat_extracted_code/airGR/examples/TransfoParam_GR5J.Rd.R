library(airGR)


### Name: TransfoParam_GR5J
### Title: Transformation of the parameters of the GR5J model
### Aliases: TransfoParam_GR5J

### ** Examples

library(airGR)

## transformation Raw -> Transformed for the GR5J model
Xraw  <- matrix(c(+221.41, -2.65,  +27.11, +1.37, -0.76,
                  +347.23, -0.64,  +60.34, +1.76, +0.30,
                  +854.01, -0.10, +148.41, +2.34, +0.52),
                  ncol = 5, byrow = TRUE)
Xtran <- TransfoParam_GR5J(ParamIn = Xraw , Direction = "RT")

## transformation Transformed -> Raw for the GR5J model
Xtran <- matrix(c(+3.60, -1.70, +3.30, -9.10, -0.70,
                  +3.90, -0.60, +4.10, -8.70, +0.30,
                  +4.50, -0.10, +5.00, -8.10, +0.50),
                  ncol = 5, byrow = TRUE)
Xraw  <- TransfoParam_GR5J(ParamIn = Xtran, Direction = "TR")



