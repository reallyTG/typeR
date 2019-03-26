library(beautier)


### Name: create_mcmc
### Title: Create an MCMC configuration.
### Aliases: create_mcmc

### ** Examples

  # Create an MCMC chain with 50 states
  mcmc <- create_mcmc(chain_length = 50000, store_every = 1000)

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    get_fasta_filename(),
    beast2_input_file,
    mcmc = mcmc
  )
  testit::assert(file.exists(beast2_input_file))



