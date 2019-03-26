library(WhopGenome)


### Name: VCF_snpmat_diplo_bial_geno_filtered
### Title: Read SNP matrices in one of various representations.
### Aliases: VCF_snpmat_diplo_bial_geno_filtered
###   VCF_snpmat_diplo_bial_geno_filtered
###   VCF_snpmat_diplo_anyal_geno_filtered
###   VCF_snpmat_diplo_bial_geno_unfiltered
###   VCF_snpmat_diplo_anyal_geno_unfiltered
###   VCF_snpmat_diplo_bial_ishet_filtered
###   VCF_snpmat_diplo_anyal_ishet_filtered
###   VCF_snpmat_diplo_bial_ishet_unfiltered
###   VCF_snpmat_diplo_anyal_ishet_unfiltered
###   VCF_snpmat_diplo_bial_hasalt_filtered
###   VCF_snpmat_diplo_bial_hasalt_unfiltered
###   VCF_snpmat_diplo_anyal_hasalt_filtered
###   VCF_snpmat_diplo_anyal_hasalt_unfiltered
###   VCF_snpmat_diplo_bial_nucodes_filtered
###   VCF_snpmat_diplo_bial_nucodes_unfiltered
###   VCF_snpmat_diplo_anyal_nucodes_filtered
###   VCF_snpmat_diplo_anyal_nucodes_unfiltered
###   VCF_snpmat_anyplo_bial_nucodes_filtered
###   VCF_snpmat_anyplo_bial_nucodes_unfiltered
###   VCF_snpmat_anyplo_anyal_nucodes_filtered
###   VCF_snpmat_anyplo_anyal_nucodes_unfiltered VCF_readIntoCodeMatrix
###   read_snp_diplo_bial_int_altpresence read_snp_diplo_bial_int_nuclcodes
###   read_snp_diplo_bial_str_allelechars read_snp_diplo_bial_str_01
###   read_snp_diplo_bial_str_nuclcodes

### ** Examples

	##
	##	Example :
	##
	vcffile <- vcf_open( system.file( "extdata" , "ex.vcf.gz" , package="WhopGenome" ) )
	vcf_setregion(vcffile, "Y", 1, 100000 )
	
	sn <- vcf_getsamples( vcffile )
	vcf_selectsamples( vcffile , sn )
	
	m <- matrix( data=as.integer(0) , nrow = length(sn) , ncol = 4 )
	
	VCF_read_snp_diplo_bial_int_nuclcodes( vcffile , m )
	m




