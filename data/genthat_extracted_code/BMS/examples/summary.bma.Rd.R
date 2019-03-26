library(BMS)


### Name: summary.bma
### Title: Summary Statistics for a 'bma' Object
### Aliases: summary.bma info.bma
### Keywords: utilities

### ** Examples

  data(datafls)

  m_fixed=bms(datafls,burn=1000,iter=3000,user.int=FALSE, )
  summary(m_fixed)
   
  m_ebl=bms(datafls,burn=1000,iter=3000,user.int=FALSE, g="EBL",g.stats=TRUE)
  info.bma(m_ebl)




