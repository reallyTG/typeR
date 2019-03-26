library(vegan)


### Name: make.cepnames
### Title: Abbreviates a Botanical or Zoological Latin Name into an
###   Eight-character Name
### Aliases: make.cepnames
### Keywords: character

### ** Examples

make.cepnames(c("Aa maderoi", "Poa sp.", "Cladina rangiferina",
"Cladonia cornuta", "Cladonia cornuta var. groenlandica",
"Cladonia rangiformis", "Bryoerythrophyllum"))
data(BCI)
colnames(BCI) <- make.cepnames(colnames(BCI))



