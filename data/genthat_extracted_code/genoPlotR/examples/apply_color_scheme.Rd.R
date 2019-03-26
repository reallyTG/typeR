library(genoPlotR)


### Name: apply_color_scheme
### Title: Apply a color scheme
### Aliases: apply_color_scheme
### Keywords: data

### ** Examples

## Load data
data(three_genes)

## Color schemes
## Greys
comparisons[[1]]$values <- c(70, 80, 90)
comparisons[[1]]$col <- apply_color_scheme(comparisons[[1]]$values,
                                           color_scheme="grey")
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons)
## Red-blue
comparisons[[1]]$col <- apply_color_scheme(comparisons[[1]]$values,
                                           direction=comparisons[[1]]$direction,
                                           color_scheme="red_blue")
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons)
## Decreasing
comparisons[[1]]$col <- apply_color_scheme(comparisons[[1]]$values,
                                           direction=comparisons[[1]]$direction,
                                           color_scheme="red_blue",
                                           decreasing=TRUE)
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons)
## Range
comparisons[[1]]$col <- apply_color_scheme(comparisons[[1]]$values,
                                           direction=comparisons[[1]]$direction,
                                           color_scheme="red_blue",
                                           rng=c(30,100))
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons)
## Transparency
x1 <- seq(100, 600, by=50)
x2 <- seq(1100, 700, by=-50)
comparisons[[2]] <- as.comparison(data.frame(start1=c(x1, x2),
                                             end1=c(x1+250, x2+300),
                                             start2=c(x1+150, x2-300)+2000,
                                             end2=c(x1+250, x2-500)+2000
                                             ))
comparisons[[2]]$col <- apply_color_scheme(1:nrow(comparisons[[2]]),
                                           comparisons[[2]]$direction,
                                           color_scheme="blue_red")
comparisons[[1]]$col <- apply_color_scheme(comparisons[[1]]$values,
                                           color_scheme="grey",
                                           transparency=0.8)
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons)
comparisons[[1]]$col <- apply_color_scheme(comparisons[[1]]$values,
                                           color_scheme="grey",
                                           transparency=1)
comparisons[[2]]$col <- apply_color_scheme(1:nrow(comparisons[[2]]),
                                           comparisons[[2]]$direction,
                                           color_scheme="blue_red",
                                           transparency=0.2)
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons)



