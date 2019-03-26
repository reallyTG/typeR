library(OutbreakTools)


### Name: obkSequences-class
### Title: Formal class "obkSequences"
### Aliases: obkSequences obkSequences-class obkSequencesOrNULL-class
###   initialize,obkSequences-method show,obkSequences-method get.locus
###   get.locus,obkSequences-method get.locus.obkSequences get.nlocus
###   get.nlocus,obkSequences-method get.nlocus.obkSequences get.sequences
###   get.sequences,obkSequences-method get.sequences.obkSequences
###   get.nsequences get.nsequences,obkSequences-method
###   get.nsequences.obkSequences get.dna get.dna,obkSequences-method
###   get.dna.obkSequences
### Keywords: classes

### ** Examples

## construct an obkSequences object ##

data(ToyOutbreakRaw)
attach(ToyOutbreakRaw)
x <- new("obkSequences", dna, individualID=dna.info$individualID,
    date=dna.info$date)
x
detach(ToyOutbreakRaw)

## Load ToyOutbreak, a simulated outbreak stored in a obkData object  ##
data(ToyOutbreak)
x <- ToyOutbreak

## show obkObject
##summary(x) # generates an error

## access raw content
get.dna(x)

## access data by locus
get.nlocus(x)
get.locus(x)
get.dna(x, locus=1)
get.dna(x, locus="gene2")
get.dna(x, locus=1:2)
get.nsequences(x)
get.nsequences(x, "bylocus")

get.sequences(x)

## access data by sequence ID
get.dna(x, id=c("10"))
get.dna(x, id=c("100","354"))
get.dna(x, id=c(100:105))




