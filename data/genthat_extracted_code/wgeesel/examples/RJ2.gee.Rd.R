library(wgeesel)


### Name: RJ2.gee
### Title: Corrected RJC for GEE
### Aliases: RJ2.gee
### Keywords: RJC gee

### ** Examples

data(ohio)

fit <- wgee(resp ~ age + smoke+age:smoke, data=ohio, id=ohio$id, 
            family="binomial",corstr="exchangeable")
RJ2.gee(fit)       




