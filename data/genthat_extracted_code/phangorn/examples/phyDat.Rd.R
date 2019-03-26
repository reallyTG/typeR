library(phangorn)


### Name: phyDat
### Title: Conversion among Sequence Formats
### Aliases: phyDat as.phyDat.character as.phyDat.data.frame
###   as.phyDat.matrix as.MultipleAlignment as.MultipleAlignment.phyDat
###   cbind.phyDat c.phyDat acgt2ry removeUndeterminedSites
###   phyDat2MultipleAlignment dna2codon codon2dna as.phyDat
###   as.phyDat.factor as.phyDat.DNAbin as.phyDat.alignment
###   phyDat2alignment as.phyDat.MultipleAlignment as.character.phyDat
###   as.data.frame.phyDat as.DNAbin.phyDat as.AAbin.phyDat write.phyDat
###   read.phyDat baseFreq subset.phyDat unique.phyDat allSitePattern
###   genlight2phyDat image.phyDat
### Keywords: cluster

### ** Examples


data(Laurasiatherian)
class(Laurasiatherian)
Laurasiatherian
baseFreq(Laurasiatherian)
baseFreq(Laurasiatherian, all=TRUE)
subset(Laurasiatherian, subset=1:5)
# transform into old ape format
LauraChar <- as.character(Laurasiatherian)
# and back 
Laura <- phyDat(LauraChar)
all.equal(Laurasiatherian, Laura)
allSitePattern(5)




