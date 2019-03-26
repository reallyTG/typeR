library(patPRO)


### Name: plotBacterialLoad
### Title: Plot Supplemental Bacterial Load Information.
### Aliases: plotBacterialLoad
### Keywords: package

### ** Examples

data("PatProBacLoad",package="patPRO")
data("PatProMap",package="patPRO")
mergedMapBacLoad <- mergeMapMetaData(map.file=PatProMap, 
	merging.file=PatProBacLoad, 
	map.sub.id="SubjectID", 
	map.tmpt="Time_point", 
	map.smpl.id="SampleID", 
	sample.id.col="SampleID")
# Plot individual subject
bacLoad <- plotBacterialLoad(mergedMapBacLoad, 
	1, 
	bac.load.col="Num_Bacteria", 
	plot.title="Subject One Bacterial Load")
# Plot subject means
BacMean <- patientMean(x=mergedMapBacLoad, 
	sub.range=c(1:5), 
	metric.col="", 
	abundance.val="Num_Bacteria")
bacLoadMean <- plotBacterialLoad(BacMean, 
	"", 
	bac.load.col="Num_Bacteria", 
	plot.title="Mean Bacterial Load For Subjects 1-5", 
	mean.mark=TRUE)



