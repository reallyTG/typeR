library(WhopGenome)


### Name: vcf_getheaderline
### Title: Return one of the header lines of the VCF file
### Aliases: vcf_getheaderline

### ** Examples

	vcffile <- vcf_open( system.file( "extdata", "ex.vcf.gz" , package="WhopGenome") )
	vcf_getheaderline( vcffile , as.integer(0) )
	vcf_getheaderline( vcffile , as.integer(1) )



