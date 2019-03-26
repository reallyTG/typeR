library(spider)


### Name: read.GB
### Title: Download sequences from Genbank with metadata.
### Aliases: read.GB
### Keywords: Datasets

### ** Examples


## Not run: 
##D read.GB("AY059961")
##D 
##D #Download the sequences making data(anoteropsis) from Genbank
##D nums <- 59961:59993
##D seqs <- paste("AY0", nums, sep="")
##D dat <- read.GB(seqs)
##D 
##D attr(dat, "species")
##D attr(dat, "gene")
##D attr(dat, "accession_num")
## End(Not run)




