library(taxlist)


### Name: df2taxlist
### Title: Convert Data Frames into taxlist Objects
### Aliases: df2taxlist df2taxlist,data.frame,logical-method
###   df2taxlist,data.frame,missing-method
###   df2taxlist,character,missing-method
### Keywords: methods

### ** Examples

library(taxlist)

## Read the table with names of Cyperus species
Cyperus <- read.csv(file.path(path.package("taxlist"), "cyperus", "names.csv"),
	stringsAsFactors=FALSE)
head(Cyperus)

## Convert to 'taxlist' object
Cyperus <- df2taxlist(Cyperus, AcceptedName=!Cyperus$SYNONYM)
summary(Cyperus)

## Create a 'taxlist' object from character vectors
Plants <- df2taxlist(c("Triticum aestivum","Zea mays"), AuthorName="L.")
summary(Plants, "all")



