library(sdcMicro)


### Name: addGhostVars
### Title: addGhostVars
### Aliases: addGhostVars
### Keywords: manip

### ** Examples

data(testdata2)
sdc <- createSdcObj(testdata2,
  keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
  numVars=c('expend','income','savings'), w='sampling_weight')
## we want to link the anonymization status of key variabe 'urbrur' to 'hhcivil'
sdc <- addGhostVars(sdc, keyVar="urbrur", ghostVars=c("hhcivil"))
## we want to link the anonymization status of key variabe 'roof' to 'represent'
sdc <- addGhostVars(sdc, keyVar="roof", ghostVars=c("represent"))



