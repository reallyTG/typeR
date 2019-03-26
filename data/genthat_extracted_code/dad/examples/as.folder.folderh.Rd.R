library(dad)


### Name: as.folder.folderh
### Title: Hierarchic folder to folder
### Aliases: as.folder.folderh folderh2folder

### ** Examples

# First example: flowers               
data(roseflowers)
flg <- roseflowers$variety
flx <- roseflowers$flower

flfh <- folderh(flg, "rose", flx)
print(flfh)

flf <- as.folder(flfh)
print(flf)

# Second example: castles               
data(castles.dated)
cag <- castles.dated$periods
cax <- castles.dated$stones

cafh <- folderh(cag, "castle", cax)
print(cafh)

caf <- as.folder(cafh)
print(caf)

# Third example: leaves (example of a folderh of more than two data frames)
data(roseleaves)
lvr <- roseleaves$rose
lvs <- roseleaves$stem
lvl <- roseleaves$leaf
lvll <- roseleaves$leaflet

lfh <- folderh(lvr, "rose", lvs, "stem", lvl, "leaf", lvll)

lf1 <- as.folder(lfh, elt = "lvs", key = "rose")
print(lf1)

lf2 <- as.folder(lfh, elt = "lvl", key = "rose")
print(lf2)

lf3 <- as.folder(lfh, elt = "lvll", key = "rose")
print(lf3)

lf4 <- as.folder(lfh, elt = "lvll", key = "stem")
print(lf4)



