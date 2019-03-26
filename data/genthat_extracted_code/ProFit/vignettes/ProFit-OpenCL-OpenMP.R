## ---- eval=FALSE---------------------------------------------------------
#  library(devtools)
#  install_github('ICRAR/ProFit')

## ------------------------------------------------------------------------
library(ProFit)

## ---- fig.width=5, fig.height=5, eval=FALSE------------------------------
#  modellist=list(
#    sersic=list(
#      xcen=c(180, 60),
#      ycen=c(90, 10),
#      mag=c(15, 13),
#      re=c(14, 5),
#      nser=c(3, 10),
#      ang=c(46, 80),
#      axrat=c(0.4, 0.6),
#      box=c(0.5,-0.5)
#    ),
#    pointsource=list(
#      xcen=c(34,10,150),
#      ycen=c(74,120,130),
#      mag=c(10,13,16)
#    ),
#    sky=list(
#      bg=3e-12
#    )
#  )
#  
#  magimage(profitMakeModel(modellist=modellist, dim=c(200,200)))
#  
#  tempCL=profitOpenCLEnv()
#  magimage(profitMakeModel(modellist=modellist, dim=c(200,200), openclenv=tempCL))

## ---- eval=FALSE---------------------------------------------------------
#  system.time(profitMakeModel(modellist=modellist, dim=c(2000,2000), openclenv=tempCL))
#  system.time(profitMakeModel(modellist=modellist, dim=c(2000,2000), openclenv={}))

## ---- eval=FALSE---------------------------------------------------------
#  system.time(for(i in 1:100){profitMakeModel(modellist=modellist, dim=c(200,200), openclenv=tempCL)})
#  system.time(for(i in 1:100){profitMakeModel(modellist=modellist, dim=c(200,200), openclenv={})})

## ---- eval=FALSE---------------------------------------------------------
#  system.time(profitMakeModel(modellist=modellist, dim=c(2000,2000)))
#  system.time(profitMakeModel(modellist=modellist, dim=c(2000,2000), omp_threads=4))

## ---- eval=FALSE---------------------------------------------------------
#  system.time(for(i in 1:100){profitMakeModel(modellist=modellist, dim=c(200,200))})
#  system.time(for(i in 1:100){profitMakeModel(modellist=modellist, dim=c(200,200), omp_threads=4)})

## ---- eval=FALSE---------------------------------------------------------
#  library(doParallel)
#  library(foreach)
#  registerDoParallel(cores=4)

## ---- eval=FALSE---------------------------------------------------------
#  system.time(foreach(i=1:100)%do%{profitMakeModel(modellist=modellist, dim=c(200,200))})
#  system.time(foreach(i=1:100)%dopar%{profitMakeModel(modellist=modellist, dim=c(200,200))})

