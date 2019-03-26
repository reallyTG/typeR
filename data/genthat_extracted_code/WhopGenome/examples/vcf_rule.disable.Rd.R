library(WhopGenome)


### Name: vcf_rule.disable
### Title: Disable and enable processing of a rule
### Aliases: vcf_rule.disable vcf_rule.enable

### ** Examples

	##
	##	Example:
	##
	vcffile <- vcf_open( system.file( "extdata" , "ex.vcf.gz" , package="WhopGenome" ) )
	vcf_setregion(vcffile, "Y", 1, 100000 )
	vcf_addfilter( vcffile, "POS", "", "INT_CMP_OO",
					as.integer(49005), as.integer(49007), "DROP" )
	vcf_describefilters( vcffile )
	vcf_readLineVecFiltered( vcffile )

	vcf_rule.disable( vcffile, 0 )
	vcf_describefilters( vcffile )
	vcf_restartregion( vcffile )
	vcf_readLineVecFiltered( vcffile )



