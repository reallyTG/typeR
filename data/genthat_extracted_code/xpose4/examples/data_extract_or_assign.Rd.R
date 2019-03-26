library(xpose4)


### Name: data_extract_or_assign
### Title: Extract or assign data from an xpose.data object.
### Aliases: data_extract_or_assign Data Data<- SData SData<-
### Keywords: methods

### ** Examples


xpdb <- simpraz.xpdb

## Extract data
my.dataframe <- Data(xpdb)

## Assign data
Data(xpdb) <- my.dataframe

## Extract simulated data
my.simulated.dataframe <- SData(xpdb)

## Assign simulated data
SData(xpdb) <- my.simulated.dataframe




