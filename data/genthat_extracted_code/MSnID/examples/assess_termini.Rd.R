library(MSnID)


### Name: assess_termini
### Title: Checks if the peptide termini conforms with cleavage specificity
### Aliases: assess_termini

### ** Examples

data(c_elegans)
# adding column numIrregCleavages 
# containing count of irregularly cleaved termini
msnidObj <- assess_termini(msnidObj, validCleavagePattern="[KR]\\.[^P]")
# check the distribution
table(msnidObj$numIrregCleavages)



