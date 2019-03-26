library(strataG)


### Name: gtypes.accessors
### Title: 'gtypes' Accessors
### Aliases: gtypes.accessors accessors nInd,gtypes-method nInd
###   nLoc,gtypes-method nLoc nStrata nStrata,gtypes-method nStrata
###   indNames,gtypes-method indNames locNames,gtypes-method locNames
###   strataNames strataNames,gtypes-method strataNames
###   ploidy,gtypes-method ploidy other,gtypes-method other
###   strata,gtypes-method strata strata<- strata<-,gtypes-method strata
###   schemes schemes,gtypes-method schemes schemes<-
###   schemes<-,gtypes-method schemes alleleNames alleleNames,gtypes-method
###   alleleNames sequences sequences,gtypes-method sequences description
###   description,gtypes-method description description<-
###   description<-,gtypes-method description [,gtypes,ANY,ANY,ANY-method
###   index subset

### ** Examples

#--- create a diploid (microsatellite) gtypes object
data(msats.g)
msats.g <- stratify(msats.g, "fine")

nStrata(msats.g)
strataNames(msats.g)
nLoc(msats.g)
locNames(msats.g)

# reassign all samples to two randomly chosen strata
strata(msats.g) <- sample(c("A", "B"), nInd(msats.g), rep = TRUE)
msats.g


#--- a sequence example
library(ape)
data(woodmouse)
genes <- list(gene1=woodmouse[,1:500], gene2=woodmouse[,501:965])
x <- new("multidna", genes)
wood.g <- sequence2gtypes(x)
strata(wood.g) <- sample(c("A", "B"), nInd(wood.g), rep = TRUE)
wood.g

# get the multidna sequence object
multi.seqs <- sequences(wood.g)
class(multi.seqs) # "multidna"

# get a list of DNAbin objects
library(apex)
dnabin.list <- getSequences(multi.seqs)
class(dnabin.list) # "list"

# get a DNAbin object of the first locus
dnabin.1 <- getSequences(multi.seqs, locNames(wood.g)[1])
class(dnabin.1) # "DNAbin"

# NOTE: The default to the 'simplify' argument in 'getSequences' is TRUE, 
#   so if there is only one locus, 'getSequences' will return a DNAbin object
#   rather than a single element list unless 'simplify = FALSE':
gene1 <- wood.g[, "gene1", ]
gene1.dnabin <- getSequences(sequences(gene1))
class(gene1.dnabin) # "DNAbin"




