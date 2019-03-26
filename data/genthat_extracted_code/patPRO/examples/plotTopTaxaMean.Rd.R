library(patPRO)


### Name: plotTopTaxaMean
### Title: Plot the Mean Relative Abundance of Top Taxa.
### Aliases: plotTopTaxaMean
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
topTaxaMean <- patientMean(x=top5RelAbund, sub.range=c(1:5), metric.col="Bacteria")
topTaxaMeanPlot <- plotTopTaxaMean(topTaxaMean, 
	plot.title="Mean Taxonomy For Subjects 1-5", 
	color.brewer.set="Set2", 
	legend.text.size = 8)



