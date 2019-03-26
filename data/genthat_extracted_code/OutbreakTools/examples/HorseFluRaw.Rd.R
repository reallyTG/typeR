library(OutbreakTools)


### Name: HorseFluRaw
### Title: Raw dataset from the Newmarket 2003 equine influenza outbreak
### Aliases: HorseFluRaw
### Keywords: dataset

### ** Examples

## Not run: 
##D ## LOAD DATA ##
##D data(HorseFluRaw)
##D attach(HorseFluRaw)
##D 
##D ## EXAMINE CONTENT ##
##D 
##D ## individual info
##D head(individuals)
##D 
##D ## records info
##D lapply(records, head)
##D 
##D ## DNA sequences
##D dna
##D 
##D ## CREATE OBKDATA ##
##D x <- new("obkData", individuals=individuals, records=records,
##D          dna=dna, sampleID=dna.info$sampleID)
##D 
##D 
##D ## MANIPULATE OBJECT ##
##D 
##D ## How many individuals and sequences?
##D get.nindividuals(x)
##D get.nsequences(x)
##D 
##D ## How many sequences per individual?
##D ind <- table(get.data(x, "individualID", where="dna"))
##D ind
##D barplot(sort(ind), horiz=TRUE, las=1,
##D        xlab="number of samples", cex.names=.8)
##D 
##D ## How many sequences for this individual?
##D ind.42 <- subset(x, individualID="42")
##D get.nsequences(ind.42)
##D 
##D ## How many samples?
##D length(unique(get.data(x, "sampleID", where="dna")))
##D 
##D ## How many sequences per sample?
##D table(get.data(x, "sampleID", where="dna"))
##D 
##D detach(HorseFluRaw)
##D 
##D 
## End(Not run)



