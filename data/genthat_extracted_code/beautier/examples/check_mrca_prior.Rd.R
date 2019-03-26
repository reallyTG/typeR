library(beautier)


### Name: check_mrca_prior
### Title: Check if the MRCA prior is a valid MRCA prior.
### Aliases: check_mrca_prior

### ** Examples

  fasta_filename <- get_beautier_path("anthus_aco.fas")
  mrca_prior <- create_mrca_prior(
    alignment_id = get_alignment_id(fasta_filename = fasta_filename),
    taxa_names = get_taxa_names(filename = fasta_filename)
  )
  mrca_prior <- create_mrca_prior(
   alignment_id = get_alignment_id(fasta_filename = fasta_filename),
   taxa_names = get_taxa_names(filename = fasta_filename)
  )
  testthat::expect_silent(check_mrca_prior(mrca_prior))

  # NA is a valid MRCA prior
  testthat::expect_silent(check_mrca_prior(mrca_prior = NA))

  # Must stop on non-MRCA priors
  testthat::expect_error(check_mrca_prior(mrca_prior = "nonsense"))
  testthat::expect_error(check_mrca_prior(mrca_prior = NULL))



