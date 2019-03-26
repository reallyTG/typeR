library(memisc)


### Name: query
### Title: Query an Object for Information
### Aliases: query query,data.set-method query,importer-method
###   query,item-method
### Keywords: manip

### ** Examples

nes1948.por <- unzip(system.file("anes/NES1948.ZIP",package="memisc"),
                     "NES1948.POR",exdir=tempfile())
nes1948 <- spss.portable.file(nes1948.por)
query(nes1948,"TRUMAN")



