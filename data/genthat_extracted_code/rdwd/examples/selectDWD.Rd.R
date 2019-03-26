library(rdwd)


### Name: selectDWD
### Title: Select data from the DWD CDC FTP Server
### Aliases: selectDWD
### Keywords: file

### ** Examples

# Give weather station name (must be existing in metaIndex):
findID("Potsdam", exactmatch=FALSE)
selectDWD("Potsdam", res="daily", var="kl", per="historical")
# all files for all stations matching "Koeln":
selectDWD("Koeln", exactmatch=FALSE)
findID("Koeln", FALSE)

## Not run: 
##D  # Excluded from CRAN checks to save time
##D # or directly give station ID:
##D selectDWD(id="00386", res="daily", var="kl", per="historical")
##D selectDWD(id=386, res="daily", var="kl", per="historical")
##D # period abbreviatable:
##D selectDWD(id="00386", res="daily", var="kl", per="h")
##D selectDWD(id="00386", res="daily", var="kl", per="h", meta=TRUE)
##D 
##D # vectorizable:
##D selectDWD(id="01050", res="daily", var="kl", per=c("r","h"))
##D selectDWD(id="01050", res="daily", var="kl", per="rh", outvec=TRUE)
##D selectDWD(id="01050", res=c("daily","monthly"), var="kl", per="r")
##D # vectorization gives not the outer product, but elementwise comparison:
##D selectDWD(id="01050", res=c("daily","monthly"), var="kl", per="hr")
##D 
##D # all zip files in all paths matching id:
##D selectDWD(id=c(1050, 386))
##D # all zip files in a given path (if ID is empty):
##D head(  selectDWD(id="", res="daily", var="kl", per="recent")   )
##D 
##D # See if warnings come as expected and are informative:
##D selectDWD()
##D selectDWD(7777)
##D selectDWD(id=7777)
##D selectDWD(id="", res="dummy", var="dummy")
##D selectDWD(res="dummy")
##D selectDWD(res="daily", per="r")
##D selectDWD(res="daily", var="kl")
##D selectDWD(id="01050", res=c("daily","monthly"), var="kl") # needs 'per'
##D selectDWD(id="00386", meta=TRUE)
##D 
##D selectDWD("Potsdam", res="daily", var="solar")
##D # should be an error:
##D berryFunctions::is.error(  selectDWD(id="Potsdam", res="daily", var="solar"), TRUE)
##D berryFunctions::is.error(  selectDWD(id="", current=TRUE) , tell=TRUE, force=TRUE)
## End(Not run)




