library(OutbreakTools)


### Name: get.individuals
### Title: Retrieve individual identifiers
### Aliases: get.individuals get.nindividuals
###   get.individuals,obkData-method get.individuals.obkData
###   get.nindividuals,obkData-method get.nindividuals.obkData
###   get.individuals,obkSequences-method get.individuals.obkSequences
###   get.nindividuals,obkSequences-method get.nindividuals.obkSequences
###   get.individuals,obkContacts-method get.individuals.obkContacts
###   get.nindividuals,obkContacts-method get.nindividuals.obkContacts
### Keywords: classes

### ** Examples


## LOAD DATA ##
data(ToyOutbreak)

## VARIOUS USE OF GET.INDIVIDUALS ##
get.individuals(ToyOutbreak)

get.nindividuals(ToyOutbreak, "records")
get.individuals(ToyOutbreak, "records")

get.nindividuals(ToyOutbreak, "contacts")
get.individuals(ToyOutbreak, "contacts")





