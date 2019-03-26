library(msigdbr)


### Name: msigdbr
### Title: Retrieve the msigdbr data frame
### Aliases: msigdbr

### ** Examples

# all human gene sets
m = msigdbr(species = "Homo sapiens")

# mouse C2 (curated) CGP (chemical and genetic perturbations) gene sets
m = msigdbr(species = "Mus musculus", category = "C2", subcategory = "CGP")



