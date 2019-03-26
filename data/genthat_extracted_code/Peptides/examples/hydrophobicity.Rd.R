library(Peptides)


### Name: hydrophobicity
### Title: Compute the hydrophobicity index of a protein sequence
### Aliases: hydrophobicity

### ** Examples

# COMPARED TO GRAVY Grand average of hydropathicity (GRAVY) ExPASy
# http://web.expasy.org/cgi-bin/protparam/protparam
# SEQUENCE: QWGRRCCGWGPGRRYCVRWC
# GRAVY: -0.950

hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Aboderin")
#[1] 3.84
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "AbrahamLeo")
#[1] 0.092
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Argos")
#[1] 1.033
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "BlackMould")
#[1] 0.50125
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "BullBreese")
#[1] 0.1575
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Casari")
#[1] 0.38
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Chothia")
#[1] 0.262
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Cid")
#[1] 0.198
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Cowan3.4")
#[1] 0.0845
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Cowan7.5")
#[1] 0.0605
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Eisenberg")
#[1] -0.3265
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Engelman")
#[1] 2.31
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Fasman")
#[1] -1.2905
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Fauchere")
#[1] 0.527
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Goldsack")
#[1] 1.2245
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Guy")
#[1] 0.193
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "HoppWoods")
#[1] -0.14
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Janin")
#[1] -0.105
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Jones")
#[1] 1.4675
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Juretic")
#[1] -1.106
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Kidera")
#[1] -0.0405
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Kuhn")
#[1] 0.9155
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "KyteDoolittle")
#[1] -0.95
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Levitt")
#[1] -0.21
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Manavalan")
#[1] 13.0445
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Miyazawa")
#[1] 5.739
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Parker")
#[1] 1.095
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Ponnuswamy")
#[1] 0.851
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Prabhakaran")
#[1] 9.67
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Rao")
#[1] 0.813
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Rose")
#[1] 0.7575
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Roseman")
#[1] -0.495
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Sweet")
#[1] -0.1135
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Tanford")
#[1] -0.2905
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Welling")
#[1] -0.666
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Wilson")
#[1] 3.16
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Wolfenden")
#[1] -6.307
hydrophobicity(seq = "QWGRRCCGWGPGRRYCVRWC",scale = "Zimmerman")
#[1] 0.943



