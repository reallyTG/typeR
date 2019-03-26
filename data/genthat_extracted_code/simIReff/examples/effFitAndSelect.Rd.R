library(simIReff)


### Name: effFitAndSelect
### Title: Automatic Fitting and Selection of Effectiveness Distributions
### Aliases: effFitAndSelect effContFitAndSelect effDiscFitAndSelect

### ** Examples

e <- effContFitAndSelect(web2010ap[,1], method = "logLik")
c(e$mean, e$var)
e2 <- effContFitAndSelect(web2010ap[,2], method = "logLik")
c(e2$mean, e2$var)

ee <- effContFitAndSelect(web2010ap[,1:2], method = "logLik")
sapply(ee, function(e) c(e$mean, e$var)) # same as above



