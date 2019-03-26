library(MSIseq)


### Name: Compute.input.variables
### Title: Compute Mutation Counts from Tumor Exome Somatic Mutations
### Aliases: Compute.input.variables

### ** Examples

## Not run: 
##D ## load sample data: NGStestdata, NGStestseqLen
##D 
##D data(NGStestdata)
##D data(NGStestseqLen)
##D 
##D ## download the Hg19repeats annotation file and load it
##D url <- 
##D "http://steverozen.net/data/Hg19repeats.rda"
##D file <- basename(url)
##D download.file(url, file)
##D load("Hg19repeats.rda")
##D 
##D ## get mutation counts for test data 
##D 
##D test.mutationNum<-Compute.input.variables(NGStestdata, 
##D 	repeats=Hg19repeats, seq.len = NGStestseqLen)
## End(Not run)



