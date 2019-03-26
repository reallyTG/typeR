library(rDNAse)


### Name: parSeqSim
### Title: Parallellized DNA/RNA Sequence Similarity Calculation based on
###   Sequence Alignment
### Aliases: parSeqSim
### Keywords: alignment parallel similarity

### ** Examples

## No test: 
# Be careful when testing this since it involves parallelisation
# and might produce unpredictable results in some environments

require(Biostrings)
require(foreach)
require(doParallel)

s1 = readFASTA(system.file('dnaseq/hs.fasta', package = 'rDNA'))[[1]]
s2 = readFASTA(system.file('dnaseq/hs.fasta', package = 'rDNA'))[[2]]
s3 = readFASTA(system.file('dnaseq/hs.fasta', package = 'rDNA'))[[3]]
s4 = readFASTA(system.file('dnaseq/hs.fasta', package = 'rDNA'))[[4]]
s5 = readFASTA(system.file('dnaseq/hs.fasta', package = 'rDNA'))[[5]]
plist = list(s1, s2, s3, s4, s5)
psimmat = parSeqSim(plist, cores = 2, type = 'local', submat = 'BLOSUM62')
print(psimmat)
## End(No test)



