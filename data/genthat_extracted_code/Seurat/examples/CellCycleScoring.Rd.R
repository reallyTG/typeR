library(Seurat)


### Name: CellCycleScoring
### Title: Score cell cycle phases
### Aliases: CellCycleScoring

### ** Examples

## Not run: 
##D # pbmc_small doesn't have any cell-cycle genes
##D # To run CellCycleScoring, please use a dataset with cell-cycle genes
##D # An example is available at http://satijalab.org/seurat/cell_cycle_vignette.html
##D pbmc_small <- CellCycleScoring(
##D   object = pbmc_small,
##D   g2m.genes = cc.genes$g2m.genes,
##D   s.genes = cc.genes$s.genes
##D )
##D head(x = pbmc_small@meta.data)
## End(Not run)




