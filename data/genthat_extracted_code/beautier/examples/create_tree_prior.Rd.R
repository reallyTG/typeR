library(beautier)


### Name: create_tree_prior
### Title: Internal function to create a tree prior
### Aliases: create_tree_prior

### ** Examples

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_bd_tree_prior()
  )
  testit::assert(file.exists(beast2_input_file))

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_beautier_path("test_output_6.fas"),
    beast2_input_file,
    tree_prior = create_cbs_tree_prior()
  )
  testit::assert(file.exists(beast2_input_file))

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_ccp_tree_prior()
  )
  testit::assert(file.exists(beast2_input_file))

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_cep_tree_prior()
  )
  testit::assert(file.exists(beast2_input_file))

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_yule_tree_prior()
  )
  testit::assert(file.exists(beast2_input_file))



