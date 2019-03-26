library(HMP)


### Name: Data.filter
### Title: A Data Filter
### Aliases: Data.filter

### ** Examples

	data(saliva) 
	
	### Excludes all samples with fewer than 1000 reads and collapses
	### taxa with 11th or smaller abundance into one category 
	filterDataNum <- Data.filter(saliva, "data", 1000, numTaxa=10) 
	
	### Excludes all samples with fewer than 1000 reads and collapses
	### the least abundant taxa to keep as close to 85% of the data as
	### possible
	filterDataPer <- Data.filter(saliva, "data", 1000, perTaxa=.95) 
	
	dim(saliva)
	dim(filterDataNum)
	dim(filterDataPer)



