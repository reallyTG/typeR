library(WhopGenome)


### Name: vcf_close
### Title: Close a VCF file previously opened with vcf_open.
### Aliases: vcf_close

### ** Examples

	##
	##	Example:
	##
	vcffile <- system.file( "extdata" , "ex.vcf.gz" , package="WhopGenome" )
	vcffile
	vcffh <- vcf_open( vcffile )
	vcffh
	
	##
	##
	vcf_close( vcffh )



