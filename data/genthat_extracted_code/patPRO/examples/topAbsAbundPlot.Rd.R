library(patPRO)


### Name: topAbsAbundPlot
### Title: Plot Top Taxa Abundance Normalized to Bacterial Load.
### Aliases: topAbsAbundPlot
### Keywords: package

### ** Examples

data("PatProOTU",package="patPRO")
data("PatProMap",package="patPRO")
data("PatProBacLoad",package="patPRO")
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



