library(WhopGenome)


### Name: vcf_rule.setcolumn
### Title: Set column a rule should examine.
### Aliases: vcf_rule.setcolumn

### ** Examples

	##
	##	Example:
	##
	vcffile <- vcf_open( system.file( "extdata" , "ex.vcf.gz" , package="WhopGenome" ) )
	vcf_addfilter( vcffile, "POS", "", "INT_CMP_OO",
					as.integer(49005), as.integer(49007), "DROP" )
	vcf_describefilters( vcffile )
	
	vcf_rule.setcolumn( vcffile , 0, "ID" )
	vcf_describefilters( vcffile )



