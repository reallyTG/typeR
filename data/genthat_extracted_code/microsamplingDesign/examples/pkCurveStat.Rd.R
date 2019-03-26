library(microsamplingDesign)


### Name: pkCurveStat
### Title: calculate summary statistics from a pkCurve
### Aliases: pkCurveStat pkCurveStat_auc pkCurveStat auc pkCurveStat_cMax
###   pkCurveStat cMax pkCurveStat_tMax pkCurveStat tMax

### ** Examples

  ## toy example
  timeToy               <-  1:2
  concToy               <-  1:2 
 
  pkCurveStat_auc( concToy ,  timeToy ) 
  pkCurveStat_cMax( concToy ,  timeToy  )
  pkCurveStat_tMax( concToy ,  timeToy  )

  ## real example
  times                 <-  c(0 , 1.5 , 2:10)
  concentration         <-  getExamplePkCurve( times )
  pkCurveStat_auc( concentration , times  ) 
  pkCurveStat_cMax( concentration , times   )
  pkCurveStat_tMax( concentration , times   )




