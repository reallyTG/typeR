library(FAMoS)


### Name: combine.and.fit
### Title: Combine and Fit Parameters
### Aliases: combine.and.fit

### ** Examples

#set parameters and cost function
fit.par <- c(p1 = 2, p2 = 4)
name.par <- c("p1", "p2", "p3")
defaults <- list(p1 = 0, p2 = 2, p3 = 4)
cost.function <- function(parms){
    parms[1] + parms[2] + parms[3]
}

#call combine.and.fit
combine.and.fit(par = fit.par, par.names = name.par, fit.fn = cost.function)
combine.and.fit(par = fit.par, par.names = name.par, fit.fn = cost.function, default.val = defaults)



