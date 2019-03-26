library(QCGWAS)


### Name: match_alleles
### Title: Check and correct alleles in GWAS result files
### Aliases: match_alleles
### Keywords: distribution univar

### ** Examples

# In order to keep the QCGWAS package small, no allele reference
# is included. Follow the example of the create_hapmap_reference
# function to make one.

#  data("gwa_sample")
#  hapmap_ref <- read.table("C:/new_hapmap/new_hapmap.txt",
#                  header = TRUE, stringsAsFactors = FALSE)

#  match_alleles(gwa_sample, hapmap_ref,
#    dataname = "sample data", ref_name = "HapMap",
#    save_name = "test_allele1", save_dir = "C:/new_hapmap",
#    check_strand = TRUE, plot_FRQ = TRUE)

# HQ_SNPs <- HQ_filter(data = gwa_sample, filter_NA = TRUE,
#                          filter_FRQ = 0.01, filter_cal = 0.95)
#  match_alleles(gwa_sample, hapmap_ref,
#    HQ_subset = HQ_SNPs,
#    dataname = "sample data", ref_name = "HapMap",
#    save_name = "test_allele2", save_dir = "C:/new_hapmap",
#    check_strand = TRUE, plot_FRQ = TRUE)

#  match_output <-
#    match_alleles(gwa_sample, hapmap_ref,
#      HQ_subset = HQ_SNPs,
#      delete_mismatches = TRUE, return_SNPs = TRUE,
#      delete_diffEAF = TRUE, threshold_diffEAF = 0.15,
#      dataname = "sample data", ref_name = "HapMap",
#      save_name = "test_allele3", save_dir = "C:/new_hapmap",
#      check_strand = TRUE, plot_FRQ = TRUE)
  
#  if(sum(match_output$n_negative_strand,
#         match_output$n_strandswitch, match_output$n_mismatch,
#         match_output$n_flipped, match_output$n_diffEAF) > 0){
#    gwa_sample$EFFECT_ALL   <- match_output$EFFECT_ALL
#    gwa_sample$OTHER_ALL    <- match_output$OTHER_ALL
#    gwa_sample$STRAND       <- match_output$STRAND
#    gwa_sample$EFFECT       <- match_output$EFFECT
#    gwa_sample$EFF_ALL_FREQ <- match_output$EFF_ALL_FREQ
#  }



