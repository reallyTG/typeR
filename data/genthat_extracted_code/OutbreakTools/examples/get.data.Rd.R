library(OutbreakTools)


### Name: get.data
### Title: Access data in "obkData" objects
### Aliases: get.data get.data,obkData-method get.data.obkData
### Keywords: classes

### ** Examples


## LOAD DATA ##
data(ToyOutbreak)
ls()


## VARIOUS USE OF GET.DATA ##
# list all the data with name 'Sex' from the obkData object
get.data(ToyOutbreak, "Sex")

# list all the data with 'date' from the obkData object
get.data(ToyOutbreak, "date")
get.data(ToyOutbreak, "date", showSource=TRUE)
get.data(ToyOutbreak, "date", where="records")

# Extract from the obkData object a given field
x <- get.data(ToyOutbreak, "records")
names(x) # x contains the whole 'records' list
head(x$Fever)
x <- get.data(ToyOutbreak, "samples")
names(x) # x contains the whole 'samples' data.frame




