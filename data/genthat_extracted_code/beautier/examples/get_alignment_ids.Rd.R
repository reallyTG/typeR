library(beautier)


### Name: get_alignment_ids
### Title: Get the alignment ID from one or more FASTA filenames.
### Aliases: get_alignment_ids

### ** Examples

  created <- get_alignment_ids(
    get_beautier_paths(c("anthus_aco.fas", "anthus_nd2.fas"))
  )
  expected <- c(
    get_alignment_id(get_beautier_path("anthus_aco.fas")),
    get_alignment_id(get_beautier_path("anthus_nd2.fas"))
  )
  testit::assert(created == expected)



