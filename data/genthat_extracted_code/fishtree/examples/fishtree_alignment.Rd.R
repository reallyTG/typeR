library(fishtree)


### Name: fishtree_alignment
### Title: Get aligned sequences from the Fish Tree of Life
### Aliases: fishtree_alignment

### ** Examples

surgeon_dna <- fishtree_alignment(rank = "Acanthuridae", split = TRUE)
surgeon_dna[[1]]
## Not run: 
##D par(mfrow = c(9, 3), mar = c(0.5, 0.5, 1, 0.5), xaxt = "n", yaxt = "n")
##D for (gene in names(surgeon_dna)) {
##D   image(surgeon_dna[[gene]], legend = FALSE, show.labels = FALSE)
##D   title(gene)
##D }
## End(Not run)



