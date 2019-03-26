library(pvsR)


### Name: getAllBios
### Title: Get several candidates' biographical information
### Aliases: getAllBios

### ** Examples

# First, make sure your personal PVS API key is saved as character string in the pvs.key variable:
## Not run: pvs.key <- "yourkey"
# get all officials of a certain state
## Not run: officials <- Officials.getStatewide("FL")
# get all biographical information on those officials
## Not run: bios <- getAllBios(officials$candidateId[1:100], batchsize=20)
## Not run: head(bios)



