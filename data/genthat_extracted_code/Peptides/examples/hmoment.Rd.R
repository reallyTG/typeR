library(Peptides)


### Name: hmoment
### Title: Compute the hydrophobic moment of a protein sequence
### Aliases: hmoment

### ** Examples

# COMPARED TO EMBOSS:HMOMENT
# http://emboss.bioinformatics.nl/cgi-bin/emboss/hmoment
# SEQUENCE: FLPVLAGLTPSIVPKLVCLLTKKC
# ALPHA-HELIX ANGLE=100 : 0.52
# BETA-SHEET  ANGLE=160 : 0.271

# ALPHA HELIX VALUE
hmoment(seq = "FLPVLAGLTPSIVPKLVCLLTKKC", angle = 100, window = 11)
# [1] 0.5199226

# BETA SHEET VALUE
hmoment(seq = "FLPVLAGLTPSIVPKLVCLLTKKC", angle = 160, window = 11)
# [1] 0.2705906



