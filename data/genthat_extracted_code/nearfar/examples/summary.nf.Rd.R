library(nearfar)


### Name: summary.nf
### Title: Summary method for object of class "nf"
### Aliases: summary.nf

### ** Examples

k = opt_nearfar(dta=mtcars, trt="drat", covs=c("cyl", "disp"),
    trt.type="cont", iv="carb", imp.var=NA, tol.var=NA, adjust.IV=TRUE,
    max.time.seconds=1)
summary(k)



