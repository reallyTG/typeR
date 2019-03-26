library(testthat)
library(Matrix)
library(dplyr)
context("combine_identicalmutations")

#create a simple haplotype matrix, here using the identity matrix
hap_dat <- sparseMatrix(i = 1:10, j = 1:10, x = rep(1, 10))

#create mutations dataset with recurrent SNVs
gd <- TRUE
while(gd) {
  mut_df <- data.frame(colID = 1:10,
                       chrom = rep(1, 10),
                       position = 1:10,
                       prevalence = 1,
                       type = sample(c("m1", "m2"), size = 10, replace = TRUE))

  #NOTE: the above assumes a sample size of 5,000 diploid individuals


  #choose mutations to be recurrent, assuming recurrent with previous mutatation
  #i.e. if 2, 4, 5 sampled then 1 & 2 at same position and 3, 4, & 5 at same position
  rep_muts <- sample(2:10, size = 4, replace = FALSE)
  rep_muts <- rep_muts[order(rep_muts)]

  #change position for the recurrent mutations
  for(i in 1:4){
    mut_df$position[rep_muts] <- mut_df$position[rep_muts - 1]
  }

  #calculate the allele frequency based on whether or not SNVs are recurrent
  calc_afreq <- mut_df %>%
    group_by(.data$type, .data$position) %>%
    mutate(afreq = sum(.data$prevalence)/(2*5000))
  mut_df$afreq <- calc_afreq$afreq

  if (any(sapply(unique(mut_df$type),
                 function(x){any(duplicated(mut_df$position[mut_df$type == x]))}))) {
    gd = FALSE
  }
}


#determine which mutation types have identical mutations that need
#to be recoded
rc_types <- unique(mut_df$type)[sapply(unique(mut_df$type),
                                            function(x){any(duplicated(mut_df$position[mut_df$type == x]))})]

#create second mutation and haplotype datasets to track changes
mut_df2 <- mut_df
hap_dat2 <- hap_dat
for(i in 1:length(rc_types)){
  com_data <- combine_identicalmutations(mutmap = mut_df2,
                                         hapmat = hap_dat2,
                                         mut_type = rc_types[i])
  mut_df2  <- com_data[[1]]
  hap_dat2 <- com_data[[2]]
}

#---------------------#
# Recurrent SNV tests #
#---------------------#
#test to see that recurrent SNVs (i.e. same type and position)
#are re-coded appropriately
rec_SNVs <- unique(mut_df[duplicated(mut_df[, c("position", "type")]), c("chrom", "position", "type")])

for(i in 1:nrow(rec_SNVs)){
  #locations of the ith recurrent SNV
  rec_locs <- which(mut_df$position == rec_SNVs$position[i]
                    & mut_df$type == rec_SNVs$type[i])


  test_that("recurrent SNVs are recoded in haplotype matrix correctly", {

    expected_hap <- rep(0, 10)
    expected_hap[rec_locs] <- 1
    expect_equal(expected_hap,
                 hap_dat2[, (mut_df2$colID[which(mut_df2$position == rec_SNVs$position[i]
                                                & mut_df2$type == rec_SNVs$type[i])])])
  })

  test_that("recurrent SNVs have the correct dervied allele frequency", {

    expect_equal(length(rec_locs)*0.0001,
                 mut_df2$afreq[which(mut_df2$position == rec_SNVs$position[i]
                                     & mut_df2$type == rec_SNVs$type[i])])
  })

}

test_that("the returned mutations dataset does not contain any recurrent SNVs", {

  expect_false(any(duplicated(mut_df2[, c("chrom", "position", "type")])))

})

#-----------#
# SNP tests #
#-----------#
#SNVs may only take on values 0 or 1, i.e. wild type or mutant allele.
#Mutations of different type at the same location these are SNPs not SNVs
#Check to see that SNPs are handled appropriately.

#Determine if any SNPs exist
SNP_sets <- as.data.frame(mut_df %>%
                            group_by(.data$chrom, .data$position) %>%
                            mutate(diffType = length(unique(.data$type)) > 1))
#locations of SNPs, if they exist.
nonrc_locs <- unique(SNP_sets[SNP_sets$diffType, c("chrom", "position")])


if (nrow(nonrc_locs) > 0) {
  for (i in 1:nrow(nonrc_locs)) {
    test_that("mutations of different type at the same location are
              coded separately in mutations dataset", {

                expect_equal(2,
                             nrow(mut_df2[nonrc_locs$chrom[i] == mut_df2$chrom
                                          & nonrc_locs$position[i] == mut_df2$position, ]))

    })
  }
}

