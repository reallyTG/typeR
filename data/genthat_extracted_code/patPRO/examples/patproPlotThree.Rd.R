library(patPRO)


### Name: patproPlotThree
### Title: Generate Patient Profile of Three Plots.
### Aliases: patproPlotThree
### Keywords: package

### ** Examples

# Plot individual patient
data("PatProAlphaDiv",package="patPRO")
data("PatProMap",package="patPRO")
data("PatProOTU",package="patPRO")
data("PatProBacLoad",package="patPRO")
# Alpha Diversity
mergedMapAlpha <- mergeMapMetaData(map.file=PatProMap, 
  merging.file=PatProAlphaDiv, 
  map.sub.id="SubjectID", 
  map.tmpt="Time_point", 
  map.smpl.id="SampleID", 
  sample.id.col="SampleID")
testNormAlphaDiv <- normalizeAlphaDiv(mergedMapAlpha, c("chao1","shannon"), 1)
alphaDivPlot <- plotNormalizedAlphaDiv(testNormAlphaDiv, 
  c("chao1","shannon"), 
  plot.title="Subject One Diversity", 
  color.brewer.set="Set2", 
  legend.text.size = 12)
# Bacterial Load
mergedMapBacLoad <- mergeMapMetaData(map.file=PatProMap, 
  merging.file=PatProBacLoad, 
  map.sub.id="SubjectID", 
  map.tmpt="Time_point", 
  map.smpl.id="SampleID", 
  sample.id.col="SampleID")
bacLoad <- plotBacterialLoad(mergedMapBacLoad, 
  1, 
  bac.load.col="Num_Bacteria", 
  plot.title="Subject One Bacterial Load")
# Taxa Relative Abundance
transTestRelAbund <- transposeRelAbund(PatProOTU)
mergedMapTransRA <- mergeMapMetaData(map.file=PatProMap, 
  merging.file=transTestRelAbund, 
  map.sub.id="SubjectID", 
  map.tmpt="Time_point", 
  map.smpl.id="SampleID", 
  sample.id.col="SampleID")
top5RelAbund <- topRelAbundDataFrame(x=mergedMapTransRA, top.taxa.num=5)
topTaxa <- plotTopTaxa(top5RelAbund, 
  1, 
  plot.title="Subject One Taxonomy", 
  color.brewer.set="Set2", 
  mark.events=TRUE, 
  mark.times=c(2,6), 
  mark.text="Surgery", 
  legend.text.size=8)
# Plot three
patproPlotThree(alphaDivPlot, bacLoad, topTaxa, "Subject One Profile")



