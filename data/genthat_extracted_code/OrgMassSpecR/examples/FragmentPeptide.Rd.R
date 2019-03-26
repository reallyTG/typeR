library(OrgMassSpecR)


### Name: FragmentPeptide
### Title: Predict Peptide Fragment Ions
### Aliases: FragmentPeptide

### ** Examples

## fragment unlabeled peptide
FragmentPeptide("NECFLQHK")

## fragment peptide with carbon-13 labeled lysine
k.mass <- MonoisotopicMass(formula = list(C = 6, H = 12, N = 2, O = 1),
                       isotopes = list(C = 13.0033548378)) 
FragmentPeptide("NECFLQHk", custom = list(code = "k", mass = k.mass))

## fragment peptide with two modifications
m.mass <- MonoisotopicMass(formula = list(C=5, H=9, N=1, O=2, S=1))
FragmentPeptide("NDmELWk", custom = list(code = c("m", "k"), mass = c(m.mass, k.mass)))

## fragment a vector of peptides produced by Digest
x <- Digest(example.sequence)
y <- subset(x, nchar(x$peptide) > 5 & nchar(x$peptide) < 12)
FragmentPeptide(y$peptide)



