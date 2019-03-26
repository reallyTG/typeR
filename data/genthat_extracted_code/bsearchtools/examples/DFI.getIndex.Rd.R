library(bsearchtools)


### Name: DFI.getIndex
### Title: Extract the index information of a DFI object
### Aliases: DFI.getIndex

### ** Examples

### create a simple DFIobj
DF <- data.frame(Foo=c(3,5,7,1,5,8,7,10),
                 Bar=c("A","B","B","C","B","B","C","A"),
                 Baz=c(TRUE,FALSE),
                 stringsAsFactors=FALSE)
DFIobj <- DFI(DF, c("Foo","Bar")) # create a DFI from DF with indexes on "Foo" and "Bar" columns

### get the index data of 'Bar' column
DFI.getIndex(DFIobj,"Bar")




