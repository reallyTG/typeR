library(bio3d)


### Name: dccm.enma
### Title: Cross-Correlation for Ensemble NMA (eNMA)
### Aliases: dccm.enma
### Keywords: analysis

### ** Examples

## No test: 
## Needs MUSCLE installed - testing excluded

if(check.utility("muscle")) {

## Fetch PDB files and split to chain A only PDB files
ids <- c("1a70_A", "1czp_A", "1frd_A", "1fxi_A", "1iue_A", "1pfd_A")
files <- get.pdb(ids, split = TRUE, path = tempdir())

## Sequence/Structure Alignement
pdbs <- pdbaln(files, outfile = tempfile())

## Normal mode analysis on aligned data
modes <- nma(pdbs)

## Calculate all 6 correlation matrices
cij <- dccm(modes)

## Plot correlations for first structure
plot.dccm(cij$all.dccm[,,1])

}
## End(No test)




