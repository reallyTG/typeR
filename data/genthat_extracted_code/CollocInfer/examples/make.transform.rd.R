library(CollocInfer)


### Name: make.transfer
### Title: Transfer Functions
### Aliases: make.transfer make.id make.exp make.exptrans make.genlin
###   make.fhn make.Henon make.SEIR make.NS make.diagnostics chemo.fun
###   pomp.skeleton

### ** Examples


# Observe the FitzHugh-Nagumo equations

proc = make.SSEproc()
proc$more = make.fhn()

lik = make.SSElik()
lik$more = make.id()

# Observe an unknown scalar transform of each component of a Henon map, given
# in the first two elements of the parameter vector:

proc = make.Dproc()
proc$more = make.multinorm()
proc$more$more = c(make.Henon,make.cvar)

lik = make.multinorm()
lik$more = c(make.genlin,make.cvar)
lik$more$more = list(mat = matrix(0,2,2),sub=matrix(c(1,1,1,2,2,2),2,3,byrow=TRUE))

# Model SEIR equations on the log scale and then exponentiate

lik = make.SSElik()
lik$more = make.exp()

proc = make.SSEproc()
proc$more = make.logtrans()
proc$more$more = make.SEIR()




