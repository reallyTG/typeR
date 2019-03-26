library(affy)


### Name: ProbeSet-class
### Title: Class ProbeSet
### Aliases: ProbeSet-class mm,ProbeSet-method mm<-,ProbeSet,matrix-method
###   pm<-,ProbeSet,matrix-method pm,ProbeSet-method show,ProbeSet-method
###   barplot,ProbeSet-method colnames,ProbeSet-method
###   express.summary.stat,ProbeSet,character,character-method
###   sampleNames,ProbeSet-method
### Keywords: classes

### ** Examples

if (require(affydata)) {
  data(Dilution)
  ps <- probeset(Dilution, geneNames(Dilution)[1:2])
  names(ps)
  print(ps[[1]])
}



