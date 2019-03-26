library(BMhyb)


### Name: AttemptDeletionFix
### Title: Delete taxa to improve matrix condition
### Aliases: AttemptDeletionFix

### ** Examples

	library(ape)
	#simulate a tree of 5 taxa
	phy<-rtree(5)
	#check and adjust the phylogeny
	AdjustForDet(phy,max.attempts=100)
	


