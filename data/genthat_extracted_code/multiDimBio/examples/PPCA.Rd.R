library(multiDimBio)


### Name: PPCA
### Title: A function to perform a probabilistic principle component
###   analysis
### Aliases: PPCA

### ** Examples

	data(Nuclei)
	PPCA1<-PPCA(Nuclei, nPCs=2, CENTER=TRUE, SCALE='vector')
	Scores1<-PPCA1@scores
	


