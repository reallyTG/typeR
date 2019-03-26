library(multilaterals)


### Name: multilaterals
### Title: Transitive Index Numbers for Cross-Sections and Panel Data
### Aliases: multilaterals-package multilaterals
### Keywords: package

### ** Examples


data('multil_data')

## From 'An introduction to Efficiency and
##  Productivity Analysis' (Coelli et al., 2005), page 124-126.
inputIndx = multilateral(data.x=billy_inp_q,data.y=billy_inp_p,var.agg='year',
 idx='fisher',PAR=FALSE,transitivity='eks',bench=2000,period=NULL )
outputIndx = multilateral(data.x=billy_out_q,data.y=billy_out_p, var.agg='year',
 PAR=FALSE,transitivity='mst',bench=2000,period=NULL )
tfpIndx = outputIndx/inputIndx






