library(gimms)


### Name: monthlyIndices
### Title: Create Monthly Indices from NDVI3g Files
### Aliases: monthlyIndices

### ** Examples

## NDVI3g.v1
gimms_files_v1 <- readRDS(system.file("extdata", "inventory_ecv1.rds", package = "gimms"))

monthlyIndices(gimms_files_v1[1], version = 1)                   # indices
monthlyIndices(gimms_files_v1[1], version = 1, timestamp = TRUE) # dates

## Similarly, NDVI3g.v0
gimms_files_v0 <- readRDS(system.file("extdata", "inventory_ecv0.rds", package = "gimms"))
gimms_files_v0 <- rearrangeFiles(gimms_files_v0) # reorder by date

monthlyIndices(gimms_files_v0[1:12], version = 0)
monthlyIndices(gimms_files_v0[1:12], version = 0, timestamp = TRUE)




