library(hpar)


### Name: getHpa
### Title: HPA gene query
### Aliases: getHpa

### ** Examples

id <- "ENSG00000000003"
## Define 'hpadata' data manually
getHpa(id, hpadata = "hpaSubcellularLoc")
head(getHpa(id, hpadata = "hpaNormalTissue"), )
head(getHpa(id, hpadata = "rnaGeneTissue"))
head(getHpa(id, hpadata = "rnaGeneCellLine"))
head(getHpa(id, hpadata = "hpaCancer"))
## Sets default to "SubcellularLoc"
setHparOptions(hpadata = "hpaSubcellularLoc")
getHpa(id)       ## now uses "hpaSubcellularLoc"
setHparOptions() ## reset to "hpaNormalTissue"
head(getHpa(id))
## multiple ids
getHpa(id = c("ENSG00000000003", "ENSG00000000005"),
       hpadata = "hpaSubcellularLoc")
## Not run: 
##D ## opens a browser with http://www.proteinatlas.org/ENSG00000163435
##D getHpa("ENSG00000163435", type = "details") 
## End(Not run)



