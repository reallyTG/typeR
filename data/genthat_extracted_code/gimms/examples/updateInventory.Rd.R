library(gimms)


### Name: updateInventory
### Title: Update GIMMS NDVI3g File Inventory
### Aliases: updateInventory

### ** Examples

## Not run: 
##D updateInventory()            # NDVI3g.v1
##D updateInventory(version = 0) # NDVI3g.v0
## End(Not run)

## note that local versions of the online file inventories are also available
ofl_v1 <- system.file("extdata", "inventory_ecv1.rds", package = "gimms")
readRDS(ofl_v1)

ofl_v0 <- system.file("extdata", "inventory_ecv0.rds", package = "gimms")
readRDS(ofl_v0)




