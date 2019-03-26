library(OutbreakTools)


### Name: get.dates
### Title: Retrieve dates data
### Aliases: get.dates get.ndates get.dates,obkData-method
###   get.dates.obkData get.ndates,obkData-method get.ndates.obkData
###   get.dates,obkSequences-method get.dates.obkSequences
###   get.ndates,obkSequences-method get.ndates.obkSequences
###   get.dates,obkContacts-method get.dates.obkContacts
###   get.ndates,obkContacts-method get.ndates.obkContacts
### Keywords: classes

### ** Examples


## LOAD DATA ##
data(ToyOutbreak)

## VARIOUS USE OF GET.DATES ##
get.dates(ToyOutbreak)

get.ndates(ToyOutbreak, "records")
get.dates(ToyOutbreak, "records")

get.ndates(ToyOutbreak, "contacts")
get.dates(ToyOutbreak, "contacts")





