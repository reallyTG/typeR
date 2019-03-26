library(pinfsc50)


### Name: pinfsc50
### Title: pinfsc50: A package containing the sequence, annotations and
###   variants for _P. infestans_ Supercontig_1.50.
### Aliases: pinfsc50 pinfsc50-package

### ** Examples


## Not run: 
##D dna <- system.file("extdata", "pinf_sc50.fasta", package = "pinfsc50")
##D dna <- ape::read.dna(dna, format="fasta")
##D gff <- system.file("extdata", "pinf_sc50.gff", package = "pinfsc50")
##D gff <- read.table(gff, header=FALSE, sep="\t", quote = "")
##D vcf <- system.file("extdata", "pinf_sc50.vcf.gz", package = "pinfsc50")
##D vcf <- vcfR::read.vcfR(vcf)
## End(Not run)




