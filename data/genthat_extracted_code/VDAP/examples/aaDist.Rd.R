library(VDAP)


### Name: aaDist
### Title: Position Independent Amino Acid Distributions
### Aliases: aaDist
### Keywords: ~distributions ~composition

### ** Examples

protEx <- data.frame(Peptides = c("PWRGPWARVGSG","GYNRVGQGSG","PWRGPWARVGSG","GYNRVGQGSG","GSG"))

## Plot example with GSG linker ##

aaDistEx <- aaDist(protEx,"aaDistEx Plot",linker = TRUE)



