library(Seurat)


### Name: CombineIdent
### Title: Sets identity class information to be a combination of two
###   object attributes
### Aliases: CombineIdent

### ** Examples

groups <- sample(c("group1", "group2", "group3"), size = 80, replace = TRUE)
celltype <- sample(c("celltype1", "celltype2", "celltype3"), size = 80, replace = TRUE)
new.metadata <- data.frame(groups = groups, celltype = celltype)
rownames(new.metadata) <- pbmc_small@cell.names
pbmc_small <- AddMetaData(object = pbmc_small, metadata = new.metadata)
pbmc_small <- CombineIdent(object = pbmc_small, attribute.1 = "celltype", attribute.2 = "groups")
pbmc_small@ident




