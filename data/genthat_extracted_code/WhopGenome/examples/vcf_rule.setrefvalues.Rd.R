library(WhopGenome)


### Name: vcf_rule.setrefvalues
### Title: Set reference values for a filtering rule's comparison
###   operation.
### Aliases: vcf_rule.setrefvalues

### ** Examples

	##
	##	Example:
	##
	vcffile <- vcf_open( system.file( "extdata" , "ex.vcf.gz" , package="WhopGenome" ) )

	#
	#
	vcf_setregion(vcffile, "Y", 50000, 51000 )
	
	#
	# USELESS filter : # filter out SNPs with rule  "DROP if (0.0 < INFO:AF < 0.2)"
	#	pos 50001 has AF=0.285 , for which (0 < 0.285 < 0.2) is true 
	#
	vcf_addfilter( vcffile, "INFO", "AF", "FLT_CMP_OO", 0, 0.2, "DROP" )
	vcf_describefilters( vcffile )
	
	vcf_readLineVecFiltered( vcffile )	# pos 50001
	vcf_readLineVecFiltered( vcffile )	# pos 50002
	
	#
	#
	vcf_setregion(vcffile, "Y", 50000, 51000 )
	
	#CORRECT rule:
	# filter out SNP at pos 50001 with INFO:AF=0.285 with rule  "DROP if (0.2 < INFO:AF < 0.3)"
	#
	vcf_rule.setrefvalues( vcffile , 0 , 0.2, 0.3 )
	vcf_describefilters( vcffile )
	
	vcf_readLineVecFiltered( vcffile )	# pos 50002
	vcf_readLineVecFiltered( vcffile )	# pos 50003



