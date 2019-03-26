library(patPRO)


### Name: patproPlotTwo
### Title: Generate Patient Profile of Two Plots.
### Aliases: patproPlotTwo
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
# Absolute Abundance Estimation
transTestRelAbund <- transposeRelAbund(PatProOTU)
mergedMapTransRA <- mergeMapMetaData(map.file=PatProMap, 
	merging.file=transTestRelAbund, 
	map.sub.id="SubjectID", 
	map.tmpt="Time_point", 
	map.smpl.id="SampleID", 
	sample.id.col="SampleID")
top5RelAbund <- topRelAbundDataFrame(x=mergedMapTransRA, top.taxa.num=5)
mergedMapBacLoad <- mergeMapMetaData(map.file=PatProMap, 
	merging.file=PatProBacLoad, 
	map.sub.id="SubjectID", 
	map.tmpt="Time_point", 
	map.smpl.id="SampleID", 
	sample.id.col="SampleID")
absAbundOutDf <- topAbsAbundDataFrame(top5RelAbund, mergedMapBacLoad, bac.load.id="Num_Bacteria")
normTopTaxa <- topAbsAbundPlot(absAbundOutDf, 
	1, 
	bac.load.col="Num_Bacteria", 
	plot.title="Subject One Normalized Taxonomy", 
	color.brewer.set="Set2", 
	mark.events=TRUE, 
	mark.times=c(2,6), 
	mark.text="Surgery", 
	legend.text.size = 8)
patproPlotTwo(alphaDivPlot, normTopTaxa, "Subject One Profile")



