library(rDNAse)


### Name: make_idkmer_vec
### Title: The Increment Of Diversity Descriptors
### Aliases: IncDiv make_idkmer_vec
### Keywords: diversity extract increment of the

### ** Examples

pos = readFASTA(system.file('dnaseq/pos.fasta', package = 'rDNAse'))
neg = readFASTA(system.file('dnaseq/neg.fasta', package = 'rDNAse'))
x = 'GACTGAACTGCACTTTGGTTTCATATTATTTGCTC'
make_idkmer_vec(k = 6, x, pos, neg)



