library(Seurat)


### Name: SplitObject
### Title: Splits object into a list of subsetted objects.
### Aliases: SplitObject

### ** Examples

# Assign the test object a three level attribute
groups <- sample(c("group1", "group2", "group3"), size = 80, replace = TRUE)
names(groups) <- pbmc_small@cell.names
pbmc_small <- AddMetaData(object = pbmc_small, metadata = groups, col.name = "group")
obj.list <- SplitObject(pbmc_small, attribute.1 = "group")




