library(OutbreakTools)


### Name: subset
### Title: Subset data in "obkData" objects
### Aliases: subset,obkData-method subset.obkData
###   subset,obkSequences-method subset.obkSequences
###   subset,obkContacts-method subset.obkContacts
### Keywords: classes

### ** Examples


## LOAD ToyOutbreak obkData object ##
data(ToyOutbreak)
x <- ToyOutbreak


## TEST VARIOUS SUBSETTING ##
## by individual
get.individuals(x)
plot(x)
plot(subset(x, individuals=1:10))
subset(x, individuals=1)
subset(x, individuals="15")

## by locus
get.locus(x)
subset(x, locus=2)

## by locus and sequences
subset(x, locus=1, sequence=1:10)
plot(subset(x, locus=1, sequence=1:10))
plot(subset(x, locus=1, sequence=1:10), "phy")

## by dates
get.dates(x)
plotIndividualTimeline(subset(x, date.to="2000-01-05"), "dna")




