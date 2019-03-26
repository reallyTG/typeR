library(Peptides)


### Name: pI
### Title: Compute the isoelectic point (pI) of a protein sequence
### Aliases: pI

### ** Examples

# COMPARED TO ExPASy ProtParam
# http://web.expasy.org/cgi-bin/protparam/protparam
# SEQUENCE: QWGRRCCGWGPGRRYCVRWC
# Theoretical pI: 9.88

pI(seq= "QWGRRCCGWGPGRRYCVRWC",pKscale= "Bjellqvist")
# [1] 9.881

# COMPARED TO EMBOSS PEPSTATS
# http://emboss.bioinformatics.nl/cgi-bin/emboss/pepstats
# SEQUENCE: QWGRRCCGWGPGRRYCVRWC
# Isoelectric Point = 9.7158

pI(seq= "QWGRRCCGWGPGRRYCVRWC",pKscale= "EMBOSS")
# [1] 9.716

# OTHER SCALES

pI(seq= "QWGRRCCGWGPGRRYCVRWC",pKscale= "Murray")
# [1] 9.818
pI(seq= "QWGRRCCGWGPGRRYCVRWC",pKscale= "Sillero")
# [1] 9.891
pI(seq= "QWGRRCCGWGPGRRYCVRWC",pKscale= "Solomon")
# [1] 9.582
pI(seq= "QWGRRCCGWGPGRRYCVRWC",pKscale= "Stryer")
# [1] 9.623
pI(seq= "QWGRRCCGWGPGRRYCVRWC",pKscale= "Lehninger")
# [1] 9.931
pI(seq= "QWGRRCCGWGPGRRYCVRWC",pKscale= "Dawson")
# [1] 9.568
pI(seq= "QWGRRCCGWGPGRRYCVRWC",pKscale= "Rodwell")
# [1] 9.718



