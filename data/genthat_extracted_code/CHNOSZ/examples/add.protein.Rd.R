library(CHNOSZ)


### Name: add.protein
### Title: Amino Acid Compositions of Proteins
### Aliases: add.protein seq2aa aasum

### ** Examples

## Don't show: 
data(thermo)
## End(Don't show)
# manually adding a new protein
# Human Gastric juice peptide 1
aa <- seq2aa("GAJU_HUMAN", "LAAGKVEDSD")
ip <- add.protein(aa)
stopifnot(protein.length(ip)==10)
# the chemical formula of this peptide
as.chemical.formula(protein.formula(ip)) # "C41H69N11O18"
# we can also calculate a formula without using add.protein
aa <- seq2aa("pentapeptide_test", "ANLSG")
as.chemical.formula(protein.formula(aa))



