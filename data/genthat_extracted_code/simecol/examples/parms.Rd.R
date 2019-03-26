library(simecol)


### Name: parms
### Title: Accessor Functions for 'simObj' Objects
### Aliases: main main-methods main,simObj-method main<- main<--methods
###   main<-,simObj-method equations equations-methods
###   equations,simObj-method equations<- equations<--methods
###   equations<-,simObj-method parms parms-methods parms,simObj-method
###   parms<- parms<--methods parms<-,simObj-method init init-methods
###   init,simObj-method init<- init<--methods init<-,simObj,ANY-method
###   init<-,gridModel,matrix-method init<-,gridModel,ANY-method times
###   times-methods times,simObj-method times<- times<--methods
###   times<-,simObj-method inputs inputs-methods inputs,simObj-method
###   inputs<- inputs<--methods inputs<-,simObj-method solver
###   solver-methods solver,simObj-method solver<- solver<--methods
###   solver<-,simObj-method initfunc initfunc-methods
###   initfunc,simObj-method initfunc<- initfunc<--methods
###   initfunc<-,simObj-method out out-methods out,simObj-method
###   out,gridModel-method out,odeModel-method out<- out<--methods
###   out<-,simObj-method
### Keywords: programming

### ** Examples

data(lv)
parms(lv)
parms(lv)       <- c(k1 = 0.2, k2 = 0.5, k3 = 0.3)
parms(lv)["k2"] <- 0.5

data(conway)
parms(conway)
parms(conway)$srv <- c(2, 2)
parms(conway)

## add a new named parameter value
parms(lv)["dummy"] <- 1
## remove dummy parameter
parms(lv) <- parms(lv)[names(parms(lv)) != "dummy"]

## simulation and extraction of outputs
lv <- sim(lv)
o <- out(lv)

## remove outputs from object
out(lv) <- NULL

## store object persistently to the disk
save(lv, file = "lv.Rdata")           # in binary form
dput(as.list(lv), file = "lv-list.R") # in text form



