library(WhopGenome)


### Name: vcf_describefilters
### Title: Prints description of current filter rules
### Aliases: vcf_describefilters

### ** Examples

	##
	##	Example:
	##
	vcffile <- vcf_open( system.file( "extdata" , "ex.vcf.gz" , package="WhopGenome" ) )
	vcf_setregion(vcffile, "Y", 1, 100000 )
	vcf_addfilter( vcffile, "POS", "", "INT_CMP_OO",
					as.integer(49005), as.integer(49007), "DROP" )
	vcf_describefilters( vcffile )
	####
	####
	vcf_readLineVecFiltered( vcffile )
	vcf_readLineVecFiltered( vcffile )
	vcf_readLineVecFiltered( vcffile )
	#######
	#######
	vcf_clearfilters( vcffile )
	vcf_describefilters( vcffile )
	vcf_restartregion( vcffile )
	####
	####
	vcf_readLineVecFiltered( vcffile )
	vcf_readLineVecFiltered( vcffile )
	vcf_readLineVecFiltered( vcffile )
	##
	##
	vcf_close( vcffile )



