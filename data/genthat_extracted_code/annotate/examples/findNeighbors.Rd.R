library(annotate)


### Name: findNeighbors
### Title: A function to locate neighboring genes within a defined range
###   around a target gene represented by a Entrez Gene ID
### Aliases: findNeighbors checkArgs findChr4LL getValidChr getBoundary
###   weightByConfi
### Keywords: manip

### ** Examples

if(require("humanCHRLOC")){
   findNeighbors("humanCHRLOC", "51806", 10, upBase = 600000, downBase = 600000)
}else{
   print("Can not find neighbors without the required data package")
}



