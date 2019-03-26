library(vegtable)


### Name: read_juice
### Title: Importing 'Juice' tables.
### Aliases: read_juice

### ** Examples

library(vegtable)

## Installed 'Juice' version of 'Wetlands_veg'
Veg <- file.path(path.package("vegtable"), "juice", "Wetlands_juice.txt")
Veg <- read_juice(Veg)
names(Veg)



