library(beautier)


### Name: create_nested_sampling_mcmc
### Title: Create an MCMC object to estimate the marginal likelihood using
###   Nested Sampling.
### Aliases: create_nested_sampling_mcmc create_mcmc_nested_sampling

### ** Examples

  mcmc <- create_mcmc_nested_sampling(
    chain_length = 1e7,
    store_every = 1000,
    particle_count = 1,
    sub_chain_length = 1000,
    epsilon = 1e-12
  )

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    get_fasta_filename(),
    beast2_input_file,
    mcmc = mcmc
  )
  testit::assert(file.exists(beast2_input_file))



