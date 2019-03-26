library(rCarto)


### Name: mapChoroTypo
### Title: Typology
### Aliases: mapChoroTypo

### ** Examples

library(rCarto)
data(mtq)
# minimal example
mtq[c(1,12,18,23,33,8,24),"beach"] <- "No access to the beach"
mtq[c(2,4,5,6,9,13,17,20,21,25,26,29,31,34,11,27,7,19),"beach"] <- "Caribbean Sea"
mtq[c(14,15,16,22,28,30,32,10,3),"beach"] <- "Atlantic Ocean"
mapChoroTypo(shpFile=file.path(path.package("rCarto"), "shapes/COMMUNE"),
              shpId="INSEE_COM",df=mtq,dfId="ID",var="beach")              



