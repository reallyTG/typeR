library(apcluster)


### Name: ch22Promoters
### Title: ch22Promoters Data Set
### Aliases: ch22Promoters
### Keywords: datasets

### ** Examples

## if Biostrings package is available
if (requireNamespace("Biostrings", quietly=TRUE))
{
    ## load data set
    filepath <- system.file("examples", "ch22Promoters.fasta",
                            package="apcluster")
    ch22Promoters <- Biostrings::readDNAStringSet(filepath)

    ## display sequences
    ch22Promoters
}



