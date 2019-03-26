library(nimble)


### Name: registerDistributions
### Title: Add user-supplied distributions for use in NIMBLE BUGS models
### Aliases: registerDistributions

### ** Examples

dmyexp <- nimbleFunction(
   run = function(x = double(0), rate = double(0), log = integer(0)) {
       returnType(double(0))
       logProb <- log(rate) - x*rate
       if(log) {
           return(logProb)
       } else {
           return(exp(logProb))
       }
   })
rmyexp <- nimbleFunction(
   run = function(n = integer(0), rate = double(0)) {
       returnType(double(0))
       if(n != 1) nimPrint("rmyexp only allows n = 1; using n = 1.")
       dev <- runif(1, 0, 1)
       return(-log(1-dev) / rate)
   }
   )
registerDistributions(list(
    dmyexp = list(
              BUGSdist = "dmyexp(rate, scale)",
              Rdist = "dmyexp(rate = 1/scale)",
              altParams = "scale = 1/rate",
              pqAvail = FALSE)))
code <- nimbleCode({
    y ~ dmyexp(rate = r)
    r ~ dunif(0, 100)
})
m <- nimbleModel(code, inits = list(r = 1), data = list(y = 2))
calculate(m, 'y')
m$r <- 2
calculate(m, 'y')
m$resetData()
simulate(m, 'y')
m$y

# alternatively, simply specify a character vector with the
# name of one or more 'd' functions
deregisterDistributions('dmyexp')
registerDistributions('dmyexp')

# or simply use in BUGS code without registration
deregisterDistributions('dmyexp')
m <- nimbleModel(code, inits = list(r = 1), data = list(y = 2))

# example of Dirichlet-multinomial registration to illustrate
# use of 'types' (note that registration is not actually needed
# in this case)
ddirchmulti <- nimbleFunction(
    run = function(x = double(1), alpha = double(1), size = double(0), 
                   log = integer(0, default = 0)) {
        returnType(double(0))
        logProb <- lgamma(size) - sum(lgamma(x)) + lgamma(sum(alpha)) - 
            sum(lgamma(alpha)) + sum(lgamma(alpha + x)) - lgamma(sum(alpha) + 
                                                                 size)
        if(log) return(logProb)
        else return(exp(logProb))
    })

rdirchmulti <- nimbleFunction(
    run = function(n = integer(0), alpha = double(1), size = double(0)) {
        returnType(double(1))
        if(n != 1) print("rdirchmulti only allows n = 1; using n = 1.")
        p <- rdirch(1, alpha)
        return(rmulti(1, size = size, prob = p))
    })

registerDistributions(list(
    ddirchmulti = list(
        BUGSdist = "ddirchmulti(alpha, size)",
        types = c('value = double(1)', 'alpha = double(1)')
        )
    ))



