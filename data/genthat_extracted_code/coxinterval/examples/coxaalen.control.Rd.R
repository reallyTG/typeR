library(coxinterval)


### Name: coxaalen.control
### Title: Control a Cox-Aalen model fit
### Aliases: coxaalen.control
### Keywords: survival

### ** Examples

if (is.loaded("coxaalen", "coxinterval"))
coxaalen(Surv(left, right, type = "interval2") ~ prop(treat),
         data = cosmesis, control = coxaalen.control(iter.max = 2,
         trace = TRUE))



