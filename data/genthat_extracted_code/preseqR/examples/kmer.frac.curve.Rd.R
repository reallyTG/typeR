library(preseqR)


### Name: kmer.frac.curve
### Title: Fraction of k-mers observed at least r times
### Aliases: kmer.frac.curve
### Keywords: k-mer, sample coverage, high-throughput, metagenomics

### ** Examples

## load library
library(preseqR)

## import data
data(SRR061157_k31)

## the fraction of 31-mers represented at least 10 times in an experiment when
## sequencing 1M, 10M, 100M, 1G, 10G, 100G, 1T nucleotides
kmer.frac.curve(n=SRR061157_k31, k=31, read.len=100, seq=10^(6:12), r=10, mt=20) 



