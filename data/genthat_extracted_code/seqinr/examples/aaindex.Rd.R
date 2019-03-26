library(seqinr)


### Name: aaindex
### Title: List of 544 physicochemical and biological properties for the 20
###   amino-acids
### Aliases: aaindex
### Keywords: datasets

### ** Examples

#
# Load data:
#

data(aaindex)

#
# Supose that we need the Kyte & Doolittle Hydrophaty index. We first look
# at the entries with Kyte as author:
#

which(sapply(aaindex, function(x) length(grep("Kyte", x$A)) != 0))

#
# This should return that entry number 151 named KYTJ820101 is the only
# one that fit our request. We can access to it by position or by name,
# for instance:
#

aaindex[[151]]$I
aaindex[["KYTJ820101"]]$I
aaindex$KYTJ820101$I




