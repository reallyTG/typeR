library(adfExplorer)


### Name: get.blockID
### Title: Get the block ID from the physical location on the disk
### Aliases: get.blockID
###   get.blockID,character,numeric,numeric,numeric-method

### ** Examples

## Get the block identifier for sectors 0 up to 3 combined with
## cylinders 0 up to 3 on side 0 of the disk:
get.blockID(disktype = "DD",
            sector   = 0:3,
            side     = 0,
            cylinder = 0:3)



