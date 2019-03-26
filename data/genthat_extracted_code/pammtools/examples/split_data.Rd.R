library(pammtools)


### Name: split_data
### Title: Function to transform data without time-dependent covariates
###   into piece-wise exponential data format
### Aliases: split_data
### Keywords: internal

### ** Examples

data("veteran", package="survival")
head(veteran)
ped <- split_data(Surv(time, status)~trt + age, data=veteran,
   cut=c(0, 100, 400), id="id")
head(ped)
class(ped) # class ped (piece-wise exponential data)



