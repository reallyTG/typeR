library(beautier)


### Name: fastas_to_phylos
### Title: Create one or more random phylogenies.
### Aliases: fastas_to_phylos

### ** Examples

  # Create two random phylogies, with
  # - the same taxa names as the FASTA files
  # - the desired crown age
  fasta_filenames <- get_beautier_paths(
    c("anthus_aco.fas")
  )
  initial_phylogenies <- fastas_to_phylos(
    fasta_filenames,
    crown_age = 15
  )



