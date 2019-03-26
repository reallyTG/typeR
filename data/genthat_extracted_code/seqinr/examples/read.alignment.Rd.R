library(seqinr)


### Name: read.alignment
### Title: Read aligned sequence files in mase, clustal, phylip, fasta or
###   msf format
### Aliases: read.alignment

### ** Examples

mase.res   <- read.alignment(file = system.file("sequences/test.mase", package = "seqinr"),
 format = "mase")
clustal.res <- read.alignment(file = system.file("sequences/test.aln", package = "seqinr"),
 format="clustal")
phylip.res  <- read.alignment(file = system.file("sequences/test.phylip", package = "seqinr"),
 format = "phylip")
msf.res      <- read.alignment(file = system.file("sequences/test.msf", package = "seqinr"),
 format = "msf")
fasta.res    <- read.alignment(file = system.file("sequences/Anouk.fasta", package = "seqinr"),
 format = "fasta")

#
# Quality control routine sanity checks:
#

data(mase); stopifnot(identical(mase, mase.res))
data(clustal); stopifnot(identical(clustal, clustal.res))
data(phylip); stopifnot(identical(phylip, phylip.res))
data(msf); stopifnot(identical(msf, msf.res))
data(fasta); stopifnot(identical(fasta, fasta.res))




