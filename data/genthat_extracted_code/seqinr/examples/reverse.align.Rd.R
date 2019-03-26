library(seqinr)


### Name: reverse.align
### Title: Reverse alignment - from protein sequence alignment to nucleic
###   sequence alignment
### Aliases: reverse.align
### Keywords: manip

### ** Examples


#
# Read example 'bordetella.fasta': a triplet of orthologous genes from
# three bacterial species (Bordetella pertussis, B. parapertussis and
# B. bronchiseptica):
#

nucl.file <- system.file('sequences/bordetella.fasta', package = 'seqinr')
triplet <- read.fasta(nucl.file)

# 
# For this example, 'bordetella.pep.aln' contains the aligned protein
# sequences, in the Clustal format:
#

protaln.file <- system.file('sequences/bordetella.pep.aln', package = 'seqinr')
triplet.pep<- read.alignment(protaln.file, format = 'clustal')

#
# Call reverse.align for this example:
#

reverse.align(nucl.file = nucl.file, protaln.file = protaln.file,
                     input.format = 'clustal', out.file = 'test.revalign')

#
# Simple sanity check against expected result:
#

res.new <- read.alignment("test.revalign", format = "fasta")
data(revaligntest)
stopifnot(identical(res.new, revaligntest))

#
# Alternatively, we can use ClustalW to align the translated nucleic
# sequences. Here the ClustalW program is accessible simply by the
# 'clustalw' name.
#

## Not run: 
##D reverse.align(nucl.file = nucl.file, out.file = 'test.revalign.clustal', 
##D   align.prot = TRUE, clustal.path = 'clustalw')
## End(Not run)



