library(alignfigR)


### Name: extract_subalign
### Title: Extract subset of sequence alignment
### Aliases: extract_subalign

### ** Examples

fasta_file <- system.file("extdata", "example.fasta", package = "alignfigR")
plot_frame <- read_alignment(file = fasta_file)
subset_seq_list <- extract_subalign(plot_frame, tlist = c("Cow", "Human", "Whale"), texcl = TRUE)
subset_seq_list <- extract_subalign(plot_frame, clist = 1:25)



