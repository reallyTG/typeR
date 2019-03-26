library(wgeesel)


### Name: RJ.gee
### Title: RJC for GEE
### Aliases: RJ.gee
### Keywords: RJC gee

### ** Examples

data(ohio)

fit <- wgee(resp ~ age + smoke+age:smoke, data=ohio, id=ohio$id, 
            family="binomial", corstr="exchangeable")
       
RJ.gee(fit)




