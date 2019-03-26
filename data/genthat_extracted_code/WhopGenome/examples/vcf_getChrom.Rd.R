library(WhopGenome)


### Name: vcf_getChrom
### Title: Return a specific piece of information from the last line
###   processed with vcf_parseNextSNP or vcf_parsenextline.
### Aliases: vcf_getChrom vcf_getPos vcf_getID vcf_getRef vcf_getAlt
###   vcf_getQual vcf_getFilter vcf_getInfo vcf_getInfoField vcf_getFormat
###   vcf_getSample

### ** Examples

	##
	##	Example:
	##
	vcffile <- vcf_open( system.file( "extdata", "ex.vcf.gz" , package="WhopGenome") )
	vcf_parseNextSNP( vcffile )
	vcf_getChrom( vcffile )
	vcf_getPos( vcffile )
	vcf_getID( vcffile )
	vcf_getAlt( vcffile )
	vcf_getQual( vcffile )
	vcf_getFilter( vcffile )
	vcf_getInfoField( vcffile, "AA" )



