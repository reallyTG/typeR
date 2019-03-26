library(Peptides)


### Name: aaComp
### Title: Compute the amino acid composition of a protein sequence
### Aliases: aaComp

### ** Examples

# COMPARED TO PEPSTATS
# http://emboss.bioinformatics.nl/cgi-bin/emboss/pepstats
# Property      Residues              Number  Mole%
# Tiny          (A+C+G+S+T)             4   19.048
# Small         (A+B+C+D+G+N+P+S+T+V)   4   19.048
# Aliphatic     (A+I+L+V)               5   23.810
# Aromatic      (F+H+W+Y)               5   23.810
# Non-polar     (A+C+F+G+I+L+M+P+V+W+Y) 11  52.381
# Polar         (D+E+H+K+N+Q+R+S+T+Z)   9   42.857
# Charged       (B+D+E+H+K+R+Z)         8   38.095
# Basic         (H+K+R)                 8   38.095
# Acidic        (B+D+E+Z)               0   00.000

## AA composition of PDB: 1D9J Cecropin Peptide
aaComp(seq= "KWKLFKKIGIGKFLHSAKKFX")

## Output
#           Number  Mole %
# Tiny           4 19.048
# Small          4 19.048
# Aliphatic      5 23.810
# Aromatic       5 23.810
# NonPolar      11 52.381
# Polar          9 42.857
# Charged        8 38.095
# Basic          8 38.095
# Acidic         0  0.000



