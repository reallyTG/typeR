library(aroma.cn)


### Name: PairedPscbsModel
### Title: The PairedPscbsModel class
### Aliases: PairedPscbsModel
### Keywords: classes

### ** Examples
## Not run: 
##D   dataSet <- "GSE12702"
##D tags <- "ASCRMAv2"
##D chipType <- "Mapping250K_Nsp"
##D ds <- AromaUnitPscnBinarySet$byName(dataSet, tags=tags, chipType=chipType)
##D print(ds)
##D 
##D # Extract tumors and normals
##D idxs <- seq(from=1, to=nbrOfFiles(ds), by=2)
##D dsT <- extract(ds, idxs);
##D idxs <- seq(from=2, to=nbrOfFiles(ds), by=2)
##D dsN <- extract(ds, idxs);
##D 
##D # Setup Paired PSCBS model
##D seg <- PairedPscbsModel(dsT=dsT, dsN=dsN)
##D print(seg)
##D 
##D # Segment all tumor-normal pairs
##D fit(seg, verbose=-10)
##D 
## End(Not run)


