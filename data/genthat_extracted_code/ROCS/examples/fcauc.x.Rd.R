library(ROCS)


### Name: fcauc.x
### Title: Generating ROC plot with shading based on FDR
### Aliases: fcauc.x
### Keywords: classif

### ** Examples

#perfect separation
x0<-runif(1000)
x1<-runif(100)+2

fcauc.x(x0, x1)

#partial separation
x0<-rnorm(1000, mean=0, sd=1.5)
x1<-rnorm(100, mean=3, sd=1)

fcauc.x(x0, x1)



