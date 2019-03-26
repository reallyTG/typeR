library(phyclust)


### Name: read.seqgen
### Title: Read seqgen's Results and Return a seq.data
### Aliases: read.seqgen
### Keywords: file I/O Seq-Gen

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D set.seed(123)
##D ret.ms <- ms(nsam = 5, nreps = 1, opts = "-T")
##D ret.seqgen <- seqgen(opts = "-mHKY -l40 -s0.2", newick.tree = ret.ms[3])
##D (ret.nucleotide <- read.seqgen(ret.seqgen))
##D (ret.snp <- read.seqgen(ret.seqgen, code.type = "SNP"))
## End(Not run)



