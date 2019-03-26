library(LLSR)


### Name: AQSysDOE
### Title: AQSysDOE
### Aliases: AQSysDOE

### ** Examples

# dataSET is a data.frame which contains series of Tieline's mass fraction and information
# from both components and #' # extraction conditions (T, pH). The function perform a system
# characterizaion based on data stored in LLSR's database (or provided by the user) 
# and then calculate a DOE based on the input.
## Not run: 
##D dataSET <- AQSearch.Binodal(db.uid='56b53a50f500c502fa4a65d197fc6d84')
##D ans <- AQSysDOE(dataSET2, nTL = 5, nPoints = 5)
##D View(ans$DOE)
## End(Not run)



