library(emplik)


### Name: emplikH1.test
### Title: Empirical likelihood for hazard with right censored, left
###   truncated data
### Aliases: emplikH1.test
### Keywords: nonparametric survival htest

### ** Examples

fun <- function(x) { as.numeric(x <= 6.5) }
emplikH1.test( x=c(1,2,3,4,5), d=c(1,1,0,1,1), theta=2, fun=fun) 
fun2 <- function(x) {exp(-x)}  
emplikH1.test( x=c(1,2,3,4,5), d=c(1,1,0,1,1), theta=0.2, fun=fun2) 



