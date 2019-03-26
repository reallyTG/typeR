library(WhopGenome)


### Name: vcf_parseNextSNP
### Title: Read until next SNP or next line and buffer it
### Aliases: vcf_parseNextSNP vcf_parseNextLine

### ** Examples

	vcffile <- vcf_open( system.file( "extdata", "ex.vcf.gz" , package="WhopGenome") )
	vcf_parseNextSNP( vcffile )
	vcf_getPos( vcffile )



