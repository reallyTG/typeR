library(CollapsABEL)


### Name: plInfo
### Title: Constructor for PlInfoC class
### Aliases: plInfo plInfo,PlInfoC,character,logical-method
###   plInfo,PlInfoC,character,missing-method
###   plInfo,missing,character,logical-method
###   plInfo,missing,character,missing-method

### ** Examples

## Not run: 
##D 		pl_info = plInfo(.PlInfoC(), "mmp13", db_setup = TRUE)
##D 		isSetup(pl_info)
##D 		bim_ff = getQuery(sqliteFilePl(pl_info), "select * from bim")
##D 		fam_ff = getQuery(sqliteFilePl(pl_info), "select * from fam")
##D 		frq_ff = getQuery(sqliteFilePl(pl_info), "select * from frq")
## End(Not run)



