library(patPRO)


### Name: patientMean
### Title: Calculate Mean Patient Values.
### Aliases: patientMean
### Keywords: package

### ** Examples

# Relative Abundance Mean
data("PatProOTU",package="patPRO")
data("PatProMap",package="patPRO")
transTestRelAbund <- transposeRelAbund(PatProOTU)
mergedMapTransRA <- mergeMapMetaData(map.file=PatProMap, 
  merging.file=transTestRelAbund, 
  map.sub.id="SubjectID", 
  map.tmpt="Time_point", 
  map.smpl.id="SampleID", 
  sample.id.col="SampleID")
top5RelAbund <- topRelAbundDataFrame(x=mergedMapTransRA, top.taxa.num=5)
topTaxaMean <- patientMean(x=top5RelAbund, 
  sub.range=c(1:5), 
  metric.col="Bacteria")
# Alpha Diversity Mean
data("PatProAlphaDiv",package="patPRO")
data("PatProMap",package="patPRO")
mergedMapAlpha <- mergeMapMetaData(map.file=PatProMap, 
  merging.file=PatProAlphaDiv, 
  map.sub.id="SubjectID", 
  map.tmpt="Time_point", 
  map.smpl.id="SampleID", 
  sample.id.col="SampleID")
testNormAlphaDivForMean <- normalizeAlphaDiv(mergedMapAlpha, c("chao1","shannon"), 1:5)
AlphaDivMean <- patientMean(x=testNormAlphaDivForMean, 
  sub.range=c(1:5), 
  metric.col="variable", 
  abundance.val="value")
# Bacterial Load Mean
data("PatProBacLoad",package="patPRO")
data("PatProMap",package="patPRO")
mergedMapBacLoad <- mergeMapMetaData(map.file=PatProMap, 
  merging.file=PatProBacLoad, 
  map.sub.id="SubjectID", 
  map.tmpt="Time_point", 
  map.smpl.id="SampleID", 
  sample.id.col="SampleID")
BacMean <- patientMean(x=mergedMapBacLoad, 
  sub.range=c(1:5), 
  metric.col="", 
  abundance.val="Num_Bacteria")



