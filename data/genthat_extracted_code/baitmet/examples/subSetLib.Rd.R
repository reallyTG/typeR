library(baitmet)


### Name: subSetLib
### Title: Creation of a subset MS library
### Aliases: subSetLib

### ** Examples

# this function is useful if we want to reduce a 
# bigger MS library to a certain compounds of interest.
# For example, we can reduce the MS library included
# in BaitMet ("mslib" object containing the MassBank 
# library), to a smaller subset containing only those
# compounds with KEGG number:

kegg.ind <- which(lapply(mslib@database, function(x) x$KEGG)!="")
mslib.kegg <- subSetLib(mslib, kegg.ind)

# This is a naive example, as in fact, all the compounds
# in the mslib object have a KEGG number. However, this
# not occurs in the Golm Metabolome Database




