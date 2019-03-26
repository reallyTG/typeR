library(pems.utils)


### Name: 2.2.pems.structure
### Title: 'pems' object structure
### Aliases: 2.2.pems.structure pems.structure getPEMSElement getPEMSData
###   getPEMSConstants pemsData pemsConstants pemsHistory pemsin pemsin2
### Keywords: methods

### ** Examples


###########
##example 1 
###########

#basic usage

#using example data pems.1
#(supplied as part of pems.utils package)

#pems structure
pems.1

# extracting the pems.1 element velocity
getPEMSElement(velocity, pems.1)

## Not run: 
##D #generic (SE) equivalents
##D pems.1$velocity
##D pems.1["velocity"] 
## End(Not run)




