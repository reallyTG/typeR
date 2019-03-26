library(rDNAse)


### Name: twoSeqSim
### Title: DNA/RNA Sequence Alignment for Two DNA/RNA Sequences
### Aliases: twoSeqSim
### Keywords: alignment parallel similarity

### ** Examples

## No test: 
# Be careful when testing this since it involves sequence alignment
# and might produce unpredictable results in some environments

require(Biostrings)

s1 = readFASTA(system.file('dnaseq/hs.fasta', package = 'rDNA'))[[1]]
s2 = readFASTA(system.file('dnaseq/hs.fasta', package = 'rDNA'))[[2]]
seqalign = twoSeqSim(s1, s2)
summary(seqalign)
print(seqalign@score)
## End(No test)



