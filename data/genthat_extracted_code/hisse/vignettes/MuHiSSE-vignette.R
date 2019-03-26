## ---- eval=TRUE----------------------------------------------------------
suppressWarnings(library(hisse))
suppressWarnings(library(diversitree))

## ---- eval=TRUE----------------------------------------------------------
pars <- c(.1,  .15,  .2, .1, # lambda 1, 2, 3, 4
.03, .045, .06, 0.03, # mu 1, 2, 3, 4
.05, .05, .00,        # q12, q13, q14
.05, .00, .05,     # q21, q23, q24
.05, .00, .05,     # q31, q32, q34
.00, .05, .05)
set.seed(2)
phy <- tree.musse(pars, 30, x0=1)
states <- phy$tip.state

## ---- eval=TRUE----------------------------------------------------------
lik <- make.musse(phy, states, 4)
#lik <- make.musse(phy, states, 3)
diversitree.free = lik(pars)
print(diversitree.free)

## ---- eval=TRUE----------------------------------------------------------
states <- data.frame(phy$tip.state, phy$tip.state, 
                     row.names=names(phy$tip.state))
states <- states[phy$tip.label,]
states.trans <- states
for(i in 1:Ntip(phy)){
  if(states[i,1] == 1){
    states.trans[i,1] = 0
    states.trans[i,2] = 0
  }
  if(states[i,1] == 2){
    states.trans[i,1] = 0
    states.trans[i,2] = 1
  }
  if(states[i,1] == 3){
    states.trans[i,1] = 1
    states.trans[i,2] = 0
  }
  if(states[i,1] == 4){
    states.trans[i,1] = 1
    states.trans[i,2] = 1
  }
}
pars.hisse <- c(pars[1]+pars[5],pars[2]+pars[6],pars[3]+pars[7],pars[4]+pars[8], 
                pars[5]/pars[1],pars[6]/pars[2],pars[7]/pars[3],pars[8]/pars[4], 
                0.05,0.05,0, 0.05,0,0.05, 0.05,0,.05, 0,0.05,.05)
model.vec = rep(0,384)
model.vec[1:20] = pars.hisse
phy$node.label = NULL
cache <- hisse:::ParametersToPassMuHiSSE(model.vec=model.vec, hidden.states=TRUE, 
                                         nb.tip=Ntip(phy), nb.node=Nnode(phy), 
                                         bad.likelihood=exp(-500), ode.eps=0)
gen <- hisse:::FindGenerations(phy)
dat.tab <- hisse:::OrganizeData(states.trans, phy, f=c(1,1,1,1), hidden.states=TRUE)
hisse.constrained <- hisse:::DownPassMuHisse(dat.tab, gen=gen, cache=cache, 
                                             root.type="madfitz", condition.on.survival=TRUE,
                                             root.p=NULL)
comparison <- identical(round(hisse.constrained,4), round(diversitree.free,4))
print(comparison)

## ---- eval=TRUE----------------------------------------------------------
pars.hisse <- rep(c(pars[1]+pars[5],pars[2]+pars[6],pars[3]+pars[7],pars[4]+pars[8], 
                pars[5]/pars[1],pars[6]/pars[2],pars[7]/pars[3],pars[8]/pars[4], 
                0.05,0.05,0, 0.05,0,0.05, 0.05,0,.05, 0,0.05,.05, 1,rep(0,6), 1,
                rep(0,6), 1,rep(0,6), 1,rep(0,6)),2)
model.vec = rep(0,384)
model.vec[1:96] = pars.hisse
phy$node.label = NULL
cache <- hisse:::ParametersToPassMuHiSSE(model.vec=model.vec, hidden.states=TRUE, 
                                         nb.tip=Ntip(phy), nb.node=Nnode(phy), 
                                         bad.likelihood=exp(-500), ode.eps=0)
gen <- hisse:::FindGenerations(phy)
dat.tab <- hisse:::OrganizeData(states.trans, phy, f=c(1,1,1,1), hidden.states=TRUE)
hisse.constrained <- hisse:::DownPassMuHisse(dat.tab, gen=gen, cache=cache, 
                                             root.type="madfitz", condition.on.survival=TRUE,
                                             root.p=NULL)
comparison <- identical(round(hisse.constrained,4), round(diversitree.free,4))
print(comparison)

## ---- eval=FALSE---------------------------------------------------------
#  turnover <- c(1,1,1,1)
#  extinction.fraction <- c(1,1,1,1)
#  f = c(1,1,1,1)

## ---- eval=TRUE----------------------------------------------------------
trans.rate <- TransMatMakerMuHiSSE(hidden.traits=0)
print(trans.rate)

## ---- eval=FALSE---------------------------------------------------------
#  dull.null <- MuHiSSE(phy=phy, data=states.trans, f=f, turnover=turnover,
#                       eps=extinction.fraction, hidden.states=FALSE,
#                       trans.rate=trans.rate)

## ---- eval=FALSE---------------------------------------------------------
#  turnover <- c(1,2,3,4)
#  extinction.fraction <- c(1,1,1,1)
#  MuSSE <- MuHiSSE(phy=phy, data=states.trans, f=f, turnover=turnover,
#                       eps=extinction.fraction, hidden.states=FALSE,
#                       trans.rate=trans.rate)

## ---- eval=FALSE---------------------------------------------------------
#  turnover <- c(1,2,3,4,5,6,7,8)
#  extinction.fraction <- rep(1, 8)
#  f = c(1,1,1,1)

## ---- eval=TRUE----------------------------------------------------------
trans.rate <- TransMatMakerMuHiSSE(hidden.traits=1)
print(trans.rate)

## ---- eval=FALSE---------------------------------------------------------
#  turnover <- c(1,2,3,4)
#  extinction.fraction <- c(1,1,1,1)
#  MuHiSSE <- MuHiSSE(phy=phy, data=states.trans, f=f, turnover=turnover,
#                       eps=extinction.fraction, hidden.states=TRUE,
#                       trans.rate=trans.rate)

## ---- eval=FALSE---------------------------------------------------------
#  turnover <- c(1,1,1,1,2,2,2,2)
#  extinction.fraction <- rep(1, 8)
#  f = c(1,1,1,1)

## ---- eval=TRUE----------------------------------------------------------
trans.rate <- TransMatMakerMuHiSSE(hidden.traits=1, make.null=TRUE)
print(trans.rate)

## ---- eval=FALSE---------------------------------------------------------
#  ## Three hidden states
#  turnover <- c(rep(1,4), rep(2,4), rep(3,4))
#  extinction.fraction <- rep(1, 12)
#  trans.rate <- TransMatMakerMuHiSSE(hidden.traits=2, make.null=TRUE)
#  
#  ## Four hidden states
#  turnover <- c(rep(1,4), rep(2,4), rep(3,4), rep(4,4))
#  extinction.fraction <- rep(1, 16)
#  trans.rate <- TransMatMakerMuHiSSE(hidden.traits=3, make.null=TRUE)
#  
#  ## Five hidden states
#  turnover <- c(rep(1,4), rep(2,4), rep(3,4), rep(4,4), rep(5,4))
#  extinction.fraction <- rep(1, 20)
#  trans.rate <- TransMatMakerMuHiSSE(hidden.traits=4, make.null=TRUE)
#  
#  ## Six hidden states
#  turnover <- c(rep(1,4), rep(2,4), rep(3,4), rep(4,4), rep(5,4), rep(6,4))
#  extinction.fraction <- rep(1, 24)
#  trans.rate <- TransMatMakerMuHiSSE(hidden.traits=5, make.null=TRUE)
#  
#  ## Seven hidden states
#  turnover <- c(rep(1,4), rep(2,4), rep(3,4), rep(4,4), rep(5,4), rep(6,4),
#                rep(7, 4))
#  extinction.fraction <- rep(1, 28)
#  trans.rate <- TransMatMakerMuHiSSE(hidden.traits=6, make.null=TRUE)
#  
#  ## Eight hidden states
#  turnover <- c(rep(1,4), rep(2,4), rep(3,4), rep(4,4), rep(5,4), rep(6,4),
#                rep(7,4), rep(8,4))
#  extinction.fraction <- rep(1, 32)
#  trans.rate <- TransMatMakerMuHiSSE(hidden.traits=7, make.null=TRUE)

## ---- eval=TRUE----------------------------------------------------------
pars <- c(.1,  .15,  .2,  # lambda 1, 2, 3
.03, .045, .06, # mu 1, 2, 3
.05, 0,         # q12, q13
.05, .05,       # q21, q23
0,   .05)       # q31, q32
set.seed(2)
phy <- tree.musse(pars, 30, x0=1)
states <- phy$tip.state
lik <- make.musse(phy, states, 3)
lik.base <- constrain(lik, lambda2 ~ lambda1, lambda3 ~ lambda1,
mu2 ~ mu1, mu3 ~ mu1,
q13 ~ 0, q21 ~ q12, q23 ~ q12, q31 ~ 0.03, q32 ~ q12)

## ---- eval=TRUE----------------------------------------------------------
diversitree.constrained = lik.base(c(.1, .03, .05))
print(diversitree.constrained)

## ---- eval=TRUE----------------------------------------------------------
states <- data.frame(phy$tip.state, phy$tip.state, row.names=names(phy$tip.state))
states <- states[phy$tip.label,]
states[states[,1]==3,] = 4
pars.hisse <- c(0.1, 0.1, 0.1, 0.03, 0.03, 0.03, 0.05, 0, 0.05, 0.05, 0, 0.05)
model.vec = rep(0,120)
model.vec[1:12] = pars.hisse
phy$node.label = NULL
cache <- hisse:::ParametersToPassMuSSE(phy, states[,1], model.vec, f=c(1,1,1), hidden.states="TEST1")
geosse.constrained <- hisse:::DownPassMusse(phy, cache, hidden.states=FALSE, 
                                            root.type="madfitz", condition.on.survival=TRUE,
                                            root.p=NULL)
comparison <- identical(round(geosse.constrained,4), round(diversitree.constrained,4))
print(comparison)

## ---- eval=TRUE----------------------------------------------------------
states.trans <- states
for(i in 1:Ntip(phy)){
  if(states[i,1] == 1){
    states.trans[i,1] = 0
    states.trans[i,2] = 0
  }
  if(states[i,1] == 2){
    states.trans[i,1] = 0
    states.trans[i,2] = 1
  }
  if(states[i,1] == 4){
    states.trans[i,1] = 1
    states.trans[i,2] = 0
  }
}
pars.hisse <- c(0.1+0.03,0.1+0.03,0.1+0.03,0, 
                0.03/0.1,0.03/0.1,0.03/0.1,0,
                0.05,0,0, 0.05,0.05,0, 0.03,0.05,0, 0,0,0)
model.vec = rep(0,384)
model.vec[1:20] = pars.hisse
phy$node.label = NULL
cache <- hisse:::ParametersToPassMuHiSSE(model.vec=model.vec, hidden.states=TRUE, 
                                         nb.tip=Ntip(phy), nb.node=Nnode(phy), 
                                         bad.likelihood=exp(-500), ode.eps=0)
gen <- hisse:::FindGenerations(phy)
dat.tab <- hisse:::OrganizeData(states.trans, phy, f=c(1,1,1,0), hidden.states=TRUE)
muhisse.constrained <- hisse:::DownPassMuHisse(dat.tab, gen=gen, cache=cache, 
                                             root.type="madfitz", condition.on.survival=TRUE,
                                            root.p=NULL)
comparison <- identical(round(muhisse.constrained,4), round(diversitree.constrained,4))
print(comparison)

## ---- eval=FALSE---------------------------------------------------------
#  turnover <- c(1,2,3,0)
#  extinction.fraction <- c(1,1,1,0)
#  f = c(1,1,1,0)

## ---- eval=TRUE----------------------------------------------------------
trans.rate <- TransMatMakerMuHiSSE(hidden.traits=0)
print(trans.rate)

## ---- eval=TRUE----------------------------------------------------------
trans.rate.mod <- ParDrop(trans.rate, c(4,6,7,8))
print(trans.rate.mod)

## ---- eval=FALSE---------------------------------------------------------
#  MuHiSSE <- MuHiSSE(phy=phy, data=states.trans, f=f, turnover=turnover,
#                       eps=extinction.fraction, hidden.states=FALSE,
#                       trans.rate=trans.rate.mod)

## ---- eval=FALSE---------------------------------------------------------
#  turnover <- c(1,2,3,0, 4,5,6,0)
#  extinction.fraction <- c(1,1,1,0, 1,1,1,0)
#  f = c(1,1,1,0)
#  trans.rate <- TransMatMakerMuHiSSE(hidden.traits=1)
#  trans.rate.mod <- ParDrop(trans.rate, c(4,6,7,8,12,14,15,16))

## ---- eval=FALSE---------------------------------------------------------
#  StartingValueTry <- function(phy, data, f, trans.rate){
#  
#      freqs <- table(apply(data[,2:3], 1,
#                           function(x) switch(paste0(x, collapse=""),
#                                              "00" = 1, "01" = 2, "10" = 3, "11" = 4)))
#      samp.freq.tree <- Ntip(phy) / sum(freqs / f)
#      init.pars <- hisse:::starting.point.generator(phy, 4, samp.freq.tree, yule=FALSE)
#  
#      turnover <- c(rep(1,4), rep(2,4), rep(3,4))
#      eps <- rep(1,length(turnover))
#      NewStarting <- function(iteration){
#          turn.start <- exp(rnorm(4, log(init.pars[1]+init.pars[5]), 1))
#          eps.start <- runif(1, 0, 1)
#          trans.start <- exp(rnorm(12, log(init.pars[9])))
#          starting.vals <- c(turn.start, rep(eps.start,4), trans.start)
#          print(starting.vals)
#          tmp <- MuHiSSE(phy, data, f=f, turnover=turnover, eps=eps, trans.rate=trans.rate,
#                         hidden.states=TRUE, starting.vals=starting.vals)
#          save(tmp, file=paste("startingValsTest", iteration, ".Rsave", sep=""))
#      }
#      mclapply(1:50, NewStarting, mc.cores=50)
#  }

