library(CollocInfer)


### Name: make.logtrans
### Title: Log Transforms
### Aliases: make.logtrans make.logstate.lik make.exp.Cproc make.exp.Dproc

### ** Examples


# Model the log of an SEIR process

proc = make.SSEproc()
proc$more = make.logtrans()
proc$more$more = make.SEIR()

# Observe a linear combination  of

lik = make.logstate.lik()
lik$more = make.SSElik()
lik$more$more = make.genlin()

# SEIR Model with multivariate transition densities

proc = make.exp.Cproc()
proc$more = make.multinorm()
proc$more$more = c(make.SEIR(),make.cvar())




