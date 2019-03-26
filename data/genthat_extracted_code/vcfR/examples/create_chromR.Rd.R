library(vcfR)


### Name: create.chromR
### Title: Create chromR object
### Aliases: create.chromR vcfR2chromR vcf2chromR seq2chromR ann2chromR

### ** Examples

library(vcfR)
data(vcfR_example)
chrom <- create.chromR('sc50', seq=dna, vcf=vcf, ann=gff)
head(chrom)
chrom
plot(chrom)

chrom <- masker(chrom, min_QUAL = 1, min_DP = 300, max_DP = 700, min_MQ = 59, max_MQ = 61)
chrom <- proc.chromR(chrom, win.size=1000)

plot(chrom)
chromoqc(chrom)







