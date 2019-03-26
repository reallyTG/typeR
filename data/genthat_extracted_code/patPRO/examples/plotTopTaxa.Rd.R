library(patPRO)


### Name: plotTopTaxa
### Title: Plot a Specific Patient Relative Abundance of Top Taxa.
### Aliases: plotTopTaxa
### Keywords: package

### ** Examples

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
topTaxa <- plotTopTaxa(top5RelAbund, 
	1, 
	plot.title="Subject One Taxonomy", 
	color.brewer.set="Set2", 
	mark.events=TRUE, 
	mark.times=c(2,6), 
	mark.text="Surgery", 
	legend.text.size=8)



