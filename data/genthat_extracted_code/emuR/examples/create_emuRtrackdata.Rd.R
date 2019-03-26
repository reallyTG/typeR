library(emuR)


### Name: create_emuRtrackdata
### Title: create emuRtrackdata object
### Aliases: create_emuRtrackdata

### ** Examples

## Not run: 
##D 
##D ##################################
##D # prerequisite: loaded ae emuDB 
##D # (see ?load_emuDB for more information)
##D 
##D # query emuDB (to get object of class emuRsegs)
##D sl = query(emuDBhandle = ae, 
##D            query = "Phonetic == i:")
##D            
##D # get formats for SEGMENTs in sl (to get object of class trackdata)
##D td = get_trackdata(emuDBhandle = ae, 
##D                    seglist = sl,
##D                    onTheFlyFunctionName = "forest")
##D 
##D # create emuRtrackdata object
##D create_emuRtrackdata(sl = sl, td = td)
##D 
## End(Not run)



