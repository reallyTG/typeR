library(CollocInfer)


### Name: make.proc
### Title: Process Distributions
### Aliases: make.Dproc make.Cproc make.SSEproc

### ** Examples


# FitzHugh-Nagumo Equations

proc = make.SSEproc()
proc$more = make.fhn()

# Henon Map

proc = make.Dproc()
proc$more = make.Henon


# SEIR with multivariate normal transitions

proc = make.Cproc()
proc$more = make.multinorm()
proc$more$more = c(make.SEIR(),make.var.SEIR())




