library(phyloTop)


### Name: getLabGenealogy
### Title: Create genealogy
### Aliases: getLabGenealogy

### ** Examples

## Generate an epidemiological record:
myepirecord <- makeEpiRecord(c(1,2,3,4))
## make the corresponding genealogy from this record:
mygenealogy <- getLabGenealogy(myepirecord)
plot(mygenealogy)




