library(patPRO)


### Name: plotNormalizedAlphaDiv
### Title: Plot Normalized Alpha Diversity.
### Aliases: plotNormalizedAlphaDiv
### Keywords: package

### ** Examples

# Plot individual patient
data("PatProAlphaDiv",package="patPRO")
data("PatProMap",package="patPRO")
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
# Plot patient average
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
alphaDivPlotMean <- plotNormalizedAlphaDiv(AlphaDivMean, 
	c("chao1","shannon"), 
	plot.title="Mean Diversity For Subjects 1-5", 
	color.brewer.set="Set2", 
	mean.mark=TRUE, 
	legend.text.size = 12)



