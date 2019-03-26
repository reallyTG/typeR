library(WhopGenome)


### Name: vcf_rule.setcomparison
### Title: Set comparison operation for filtering rule.
### Aliases: vcf_rule.setcomparison

### ** Examples

	##
	##	Example:
	##
	vcffile <- vcf_open( system.file( "extdata" , "ex.vcf.gz" , package="WhopGenome" ) )
	vcf_addfilter( vcffile, "POS", "", "INT_CMP_OO",
					as.integer(49005), as.integer(49007), "DROP" )
	vcf_describefilters( vcffile )
	
	vcf_rule.setcomparison( vcffile , 0, "INT_CMP_CC" )
	vcf_describefilters( vcffile )



