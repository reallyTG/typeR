library(metaMix)


### Name: generative.prob
### Title: Compute generative probabilities from BLAST output
### Aliases: generative.prob generative.prob.nucl
### Keywords: generative.prob generative.prob.nucl

### ** Examples

# See vignette for more details

## Not run: 
##D # When using custom BLAST output file
##D step1 <-generative.prob(blast.output.file = "pathtoFile/blastOut.custom", blast.default=FALSE)
##D 
##D # When using default BLAST output file
##D step1 <-generative.prob(blast.output.file = "pathtoFile/blastOut.default",
##D                         read.length.file="pathtoFile/read.lengths",
##D                         contig.weight.file="pathtoFile/read.weights",
##D                         gi.taxon.file = "pathtoFile/taxon.file")
## End(Not run)



