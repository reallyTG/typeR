library(OrgMassSpecR)


### Name: ConvertPeptide
### Title: Convert peptide sequence.
### Aliases: ConvertPeptide

### ** Examples

ConvertPeptide("SEQENCE", output = "3letter")

# as input to MonoisotopicMass
MonoisotopicMass(formula = ConvertPeptide("SEQENCE"), charge = 1)

# as input to MolecularWeight
MolecularWeight(formula = ConvertPeptide("SEQENCE"))



