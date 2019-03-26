library(Seurat)


### Name: SplitDotPlotGG
### Title: Split Dot plot visualization
### Aliases: SplitDotPlotGG

### ** Examples

# Create a simulated grouping variable
pbmc_small@meta.data$groups <- sample(
  x = c("g1", "g2"),
  size = length(x = pbmc_small@cell.names),
  replace = TRUE
)
SplitDotPlotGG(pbmc_small, grouping.var = "groups", genes.plot = pbmc_small@var.genes[1:5])




