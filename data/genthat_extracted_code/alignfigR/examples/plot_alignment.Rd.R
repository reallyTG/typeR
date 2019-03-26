library(alignfigR)


### Name: plot_alignment
### Title: Plot a multiple sequence alignment
### Aliases: plot_alignment

### ** Examples

fasta_file <- system.file("extdata", "example.fasta", package = "alignfigR")
plot_frame <- read_alignment(file = fasta_file)
align_plot <- plot_alignment(plot_frame, "DNA")
align_plot <- plot_alignment(plot_frame, "protein")
align_plot <- plot_alignment(plot_frame, taxa = c("Cow", "Whale"), columns = c(1:25))
align_plot <- plot_alignment(plot_frame, taxa = c("Whale"), exclude_taxa = TRUE)
align_plot <- plot_alignment(plot_frame, legend_title = "") ## Remove the title



