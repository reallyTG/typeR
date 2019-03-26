library(Seurat)


### Name: SetAssayData
### Title: Assay Data Mutator Function
### Aliases: SetAssayData

### ** Examples

# Simulate CITE-Seq results
df <- t(x = data.frame(
  x = round(x = rnorm(n = 80, mean = 20, sd = 2)),
  y = round(x = rbinom(n = 80, size = 100, prob = 0.2)),
  row.names = pbmc_small@cell.names
))
pbmc_small <- SetAssayData(
  object = pbmc_small,
  assay.type = 'CITE',
  new.data = df,
  slot = 'data'
)
pbmc_small@assay




