library(Peptides)


### Name: mw
### Title: Compute the molecular weight of a protein sequence
### Aliases: mw

### ** Examples

# COMPARED TO ExPASy Compute pI/Mw tool
# http://web.expasy.org/compute_pi/
# SEQUENCE: QWGRRCCGWGPGRRYCVRWC 
# Theoretical pI/Mw: 9.88 / 2485.91 

mw(seq = "QWGRRCCGWGPGRRYCVRWC",monoisotopic = FALSE)
# [1] 2485.911

mw(seq = "QWGRRCCGWGPGRRYCVRWC",monoisotopic = TRUE)
# [1] 2484.12



