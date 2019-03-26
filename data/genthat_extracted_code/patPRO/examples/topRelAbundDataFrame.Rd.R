library(patPRO)


### Name: topRelAbundDataFrame
### Title: Format Top Taxa Data Frame for Graphing.
### Aliases: topRelAbundDataFrame
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
top5_rel_abund <- topRelAbundDataFrame(x=mergedMapTransRA, top.taxa.num=5)



