library(CollapsABEL)


### Name: fidIid
### Title: FID and IID columns from fam file
### Aliases: fidIid

### ** Examples

## Not run: 
##D pl_info = plInfo(bedstem = "mmp13", db_setup = TRUE)
##D fidiid = fidIid(pl_info)
##D fam = readFam("mmp13.fam", c("FID", "IID"))
##D all(fam == fidiid)
## End(Not run)




