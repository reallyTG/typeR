library(ade4)


### Name: bacteria
### Title: Genomes of 43 Bacteria
### Aliases: bacteria
### Keywords: datasets

### ** Examples

data(bacteria)
names(bacteria$espcodon)
names(bacteria$espaa)
names(bacteria$espbase)
sum(bacteria$espcodon) # 22,619,749 codons

if(adegraphicsLoaded()) {
  g <- scatter(dudi.coa(bacteria$espcodon, scann = FALSE), 
    posi = "bottomleft")
} else {
  scatter(dudi.coa(bacteria$espcodon, scann = FALSE), 
    posi = "bottom")
}


