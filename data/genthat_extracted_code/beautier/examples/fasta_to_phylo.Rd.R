library(beautier)


### Name: fasta_to_phylo
### Title: Create a random phylogeny, with the same taxa names as the FASTA
###   file and the desired crown age
### Aliases: fasta_to_phylo

### ** Examples

  # Create a random phylogeny, with
  # - the same taxa names as the FASTA file
  # - the desired crown age
  fasta_filename <- get_fasta_filename()
  initial_phylogeny <- fasta_to_phylo(
    fasta_filename,
    crown_age = 15
  )



