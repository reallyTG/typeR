library(airGR)


### Name: TransfoParam_GR4J
### Title: Transformation of the parameters of the GR4J model
### Aliases: TransfoParam_GR4J

### ** Examples

library(airGR)

## transformation Raw -> Transformed for the GR4J model
Xraw  <- matrix(c(+221.41, -3.63,  +30.00, +1.37,
                  +347.23, -1.03,  +60.34, +1.76,
                  +854.06, -0.10, +148.41, +2.34),
                  ncol = 4, byrow = TRUE)
Xtran <- TransfoParam_GR4J(ParamIn = Xraw , Direction = "RT")

## transformation Transformed -> Raw for the GR4J model
Xtran <- matrix(c(+3.60, -2.00, +3.40, -9.10,
                  +3.90, -0.90, +4.10, -8.70,
                  +4.50, -0.10, +5.00, -8.10),
                  ncol = 4, byrow = TRUE)
Xraw  <- TransfoParam_GR4J(ParamIn = Xtran, Direction = "TR")



