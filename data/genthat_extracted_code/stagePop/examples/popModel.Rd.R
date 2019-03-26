library(stagePop)


### Name: popModel
### Title: popModel
### Aliases: popModel

### ** Examples

rateFuncs=list(
  reproFunc=function(x,time,species,strain){
   v=10*x$flies['adults',1]*exp(-x$flies['adults',1]/100)
   return(max(v,0))
 },
 deathFunc=function(stage,x,time,species,strain){
   a=c(0.05,0.1,0.1); return(a[stage])
 },
 durationFunc=function(stage,x,time,species,strain){
   a=c(5,10); return(a[stage])
 },
 immigrationFunc=function(stage,x,time,species,strain){
   v=0
   if (stage==3 & time<1){v=100}; return(v)},
 emigrationFunc=function(stage,x,time,species,strain){return(0)}
)

modelOutput = popModel(
 numSpecies=1,
 numStages=3,
 ICs=list(matrix(0,nrow=3,ncol=1)),
 timeVec=seq(0,100,0.5),
 timeDependLoss=FALSE,
 timeDependDuration=FALSE,
 rateFunctions=rateFuncs,
 solverOptions=list(DDEsolver='PBS',tol=1e-4,hbsize=1e4,dt=0.01),
 stageNames=list(c('eggs','larvae','adults')),
 speciesNames=c('flies')
 )



