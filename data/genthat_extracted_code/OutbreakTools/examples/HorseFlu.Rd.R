library(OutbreakTools)


### Name: HorseFlu
### Title: Dataset from the Newmarket 2003 equine influenza outbreak
### Aliases: HorseFlu
### Keywords: dataset

### ** Examples

## Not run: 
##D 
##D ## LOAD DATA ##
##D data(HorseFlu)
##D 
##D ## EXAMINE CONTENT ##
##D summary(HorseFlu)
##D 
##D ## individual info
##D head(HorseFlu@individuals)
##D 
##D ## DNA sequences
##D HorseFlu@dna
##D 
##D ## records info
##D lapply(HorseFlu@records, head)
##D 
##D 
##D ## How many individuals and sequences?
##D get.nindividuals(HorseFlu)
##D get.nsequences(HorseFlu)
##D 
##D ## How many sequences per individual?
##D ind <- table(get.data(HorseFlu, "individualID", where="dna"))
##D ind
##D barplot(sort(ind), horiz=TRUE, las=1,
##D        xlab="number of samples", cex.names=.8)
##D 
##D ## How many sequences for this individual?
##D ind.42 <- subset(HorseFlu, individualID="42")
##D get.nsequences(ind.42)
##D 
##D ## How many samples?
##D length(unique(get.data(HorseFlu, "sampleID", where="dna")))
##D 
##D ## How many sequences per sample?
##D table(get.data(HorseFlu, "sampleID", where="dna"))
##D 
##D 
## End(Not run)



