library(bsearchtools)


### Name: DFI.coercion
### Title: Coerce a DFI object
### Aliases: as.data.frame.DFI as.matrix.DFI

### ** Examples

### create a simple DFIobj
DF <- data.frame(Foo=c(3,5,7,1,5,8,7,10),
                 Bar=c("A","B","B","C","B","B","C","A"),
                 Baz=c(TRUE,FALSE),
                 stringsAsFactors=FALSE)
DFIobj <- DFI(DF, c("Foo","Bar")) # create a DFI from DF with indexes on "Foo" and "Bar" columns

### coercion
as.data.frame(DFIobj)
as.matrix(DFIobj)




