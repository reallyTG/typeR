library(beautier)


### Name: create_mrca_prior
### Title: Create a Most Recent Common Ancestor prior
### Aliases: create_mrca_prior

### ** Examples

 fasta_filename <- get_beautier_path("anthus_aco.fas")

 # The first two taxa are sister species
 mrca_prior <- create_mrca_prior(
   alignment_id = get_alignment_id(fasta_filename = fasta_filename),
   taxa_names = get_taxa_names(filename = fasta_filename)[1:2]
 )

 # Set the crown age
 mrca_prior <- create_mrca_prior(
   alignment_id = get_alignment_id(fasta_filename = fasta_filename),
   taxa_names = get_taxa_names(filename = fasta_filename),
   is_monophyletic = TRUE
 )



