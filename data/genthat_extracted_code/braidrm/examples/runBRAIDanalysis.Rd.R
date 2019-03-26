library(braidrm)


### Name: runBRAIDanalysis
### Title: Run Full BRAID Analysis
### Aliases: runBRAIDanalysis
### Keywords: regression

### ** Examples

data(es8olatmz)
## Don't show: 
es8olatmz <- es8olatmz[(es8olatmz$plate==8&grepl("[AB]",es8olatmz$well))|es8olatmz$plate==9|
							(es8olatmz$plate==27&grepl("(01|02)",es8olatmz$well)),]
## End(Don't show)# Note that 'es8olatmz' contains all necessary column names, including
# 'conc1','conc2','act','compound1','compound2', and, for concentration
# correction, 'well'
## Not run: brdAnalysis <- runBRAIDanalysis(es8olatmz,defaults=c(0,-2.7),corrconc=TRUE)
brdAnalysis <- runBRAIDanalysis(es8olatmz,defaults=c(0,-4))
summary(brdAnalysis$braidFit)



