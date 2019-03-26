library(ape)


### Name: read.GenBank
### Title: Read DNA Sequences from GenBank via Internet
### Aliases: read.GenBank
### Keywords: IO

### ** Examples

## This won't work if your computer is not connected
## to the Internet

## Get the 8 sequences of tanagers (Ramphocelus)
## as used in Paradis (1997)
ref <- c("U15717", "U15718", "U15719", "U15720",
         "U15721", "U15722", "U15723", "U15724")
## Copy/paste or type the following commands if you
## want to try them.
## Not run: 
##D Rampho <- read.GenBank(ref)
##D ## get the species names:
##D attr(Rampho, "species")
##D ## build a matrix with the species names and the accession numbers:
##D cbind(attr(Rampho, "species"), names(Rampho))
##D ## print the first sequence
##D ## (can be done with `Rampho$U15717' as well)
##D Rampho[[1]]
##D ## the description from each FASTA sequence:
##D attr(Rampho, "description")
## End(Not run)



