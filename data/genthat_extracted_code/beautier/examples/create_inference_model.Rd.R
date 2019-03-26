library(beautier)


### Name: create_inference_model
### Title: Create a Bayesian phylogenetic inference model.
### Aliases: create_inference_model

### ** Examples

  # Create an MCMC chain with 50 states
  inference_model <- create_inference_model(
    mcmc = create_mcmc(chain_length = 50000, store_every = 1000)
  )

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file_from_model(
    get_fasta_filename(),
    beast2_input_file,
    inference_model = inference_model
  )
  testit::assert(file.exists(beast2_input_file))



