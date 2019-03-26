library(onemap)


### Name: group_seq
### Title: Assign markers to preexisting linkage groups
### Aliases: group_seq

### ** Examples

data(example_out) # load OneMap's fake dataset for a outcrossing population
data(vcf_example_out) # load OneMap's fake dataset from a VCF file for a outcrossing population
comb_example <- combine_onemap(example_out, vcf_example_out) # Combine datasets
twopts <- rf_2pts(comb_example)

out_CHROM <- group_seq(twopts, seqs="CHROM", rm.repeated=FALSE)
out_CHROM

seq1 <- make_seq(twopts, c(1,2,3,4,5,25,26))
seq2 <- make_seq(twopts, c(8,18))
seq3 <- make_seq(twopts, c(4,16,20,21,24,29))

out_seqs <- group_seq(twopts, seqs=list(seq1,seq2,seq3))
out_seqs





