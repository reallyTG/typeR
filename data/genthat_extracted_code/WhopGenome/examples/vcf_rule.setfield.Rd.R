library(WhopGenome)


### Name: vcf_rule.setfield
### Title: Set field or key of filtering rule.
### Aliases: vcf_rule.setfield

### ** Examples

	##
	##	Example:
	##
	vcffile <- vcf_open( system.file( "extdata" , "ex.vcf.gz" , package="WhopGenome" ) )

	#
	#
	vcf_setregion(vcffile, "Y", 50000, 51000 )
	
	#
	# USELESS filter : # filter out SNPs with rule  "DROP if (0.0 < INFO:AA < 0.5)"
	#	AA= ancestral allele, is a floating point number!
	vcf_addfilter( vcffile, "INFO", "AA", "FLT_CMP_OO", 0, 0.5, "DROP" )
	vcf_describefilters( vcffile )
	
	vcf_readLineVecFiltered( vcffile )	# pos 50001
	vcf_readLineVecFiltered( vcffile )	# pos 50002
	
	#
	#
	vcf_setregion(vcffile, "Y", 50000, 51000 )
	
	#CORRECT rule:
	# filter out SNP at pos 50001 with INFO:AF=0.285 with rule  "DROP if (0.0 < INFO:AF < 0.5)"
	#
	vcf_rule.setfield( vcffile , 0 , "AF" )
	vcf_describefilters( vcffile )
	
	vcf_readLineVecFiltered( vcffile )	# pos 50002
	vcf_readLineVecFiltered( vcffile )	# pos 50003
	



