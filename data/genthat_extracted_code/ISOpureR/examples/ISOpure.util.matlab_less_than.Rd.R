library(ISOpureR)


### Name: ISOpure.util.matlab_less_than
### Title: Less than operator
### Aliases: ISOpure.util.matlab_less_than
### Keywords: arith NA logic

### ** Examples

ISOpure.util.matlab_less_than(5,3)
#[1] FALSE
ISOpure.util.matlab_less_than(3,5)
#[1] TRUE
ISOpure.util.matlab_less_than(5,NA)
#[1] FALSE
ISOpure.util.matlab_less_than(NA,5)
#[1] FALSE
ISOpure.util.matlab_less_than(5,Inf)
#[1] TRUE
ISOpure.util.matlab_less_than(Inf,5)
#[1] FALSE



