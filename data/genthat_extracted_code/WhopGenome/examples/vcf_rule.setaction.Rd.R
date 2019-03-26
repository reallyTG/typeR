library(WhopGenome)


### Name: vcf_rule.setaction
### Title: Sets the kind of action to take when a rule matches (or does not
###   match).
### Aliases: vcf_rule.setaction

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



