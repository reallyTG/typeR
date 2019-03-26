library(decoder)


### Name: keyvalue
### Title: Coerce to a keyvalue object
### Aliases: keyvalue as.keyvalue as.keyvalue.data.frame
###   as.keyvalue.default is.keyvalue

### ** Examples

snomed <- decoder:::snomed
snomed2 <- as.keyvalue(snomed)
is.keyvalue(snomed2)
summary(snomed2)



