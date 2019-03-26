## ----echo=T,eval=FALSE---------------------------------------------------
#  library(skeleSim)
#  getwd()
#  setwd('/home/astrand/tmp') # this is the "root simulation directory" set on the actions tab
#  getwd()
#  load('title.20160413.1623.1182.params.rdata') #input data
#  ls()
#  ssClass <- runSim(ssClass) #simulate and analyze
#  save(ssClass, file = 'title.20160413.1623.1182.skeleSim.out.rdata') #save the output
#  

## ----eval=FALSE----------------------------------------------------------
#  source('title.20160413.1623.1182.script.R')

## ----eval=FALSE----------------------------------------------------------
#  
#  load('title.20160413.1623.1182.params.rdata')
#  ssClass <- runSim(ssClass) #run simulation.  now results are stored in ssClass@analysis.results
#  

