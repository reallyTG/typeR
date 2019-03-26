library(nearfar)


### Name: opt_nearfar
### Title: Finds optimal near-far match
### Aliases: opt_nearfar

### ** Examples

k = opt_nearfar(dta=mtcars, trt="drat", covs=c("cyl", "disp"),
    trt.type="cont", iv="carb", imp.var=NA, tol.var=NA, adjust.IV=TRUE,
    max.time.seconds=2)
summary(k)



