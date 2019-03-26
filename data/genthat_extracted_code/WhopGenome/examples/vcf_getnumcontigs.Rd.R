library(WhopGenome)


### Name: vcf_getnumcontigs
### Title: Get the number of different contigs/chromosomes stored in the
###   file
### Aliases: vcf_getnumcontigs

### ** Examples

	vcffile <- vcf_open( system.file( "extdata", "ex.vcf.gz" , package="WhopGenome") )
	vcf_getnumcontigs( vcffile )
	# [1] 1



