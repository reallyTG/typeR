library(randomizeR)


### Name: generateAllSequences
### Title: Complete set of randomization sequences
### Aliases: generateAllSequences getAllSeq getAllSeq,abcdPar-method
###   getAllSeq,bbcdPar-method getAllSeq,ebcPar-method
###   getAllSeq,bsdPar-method getAllSeq,chenPar-method
###   getAllSeq,crPar-method getAllSeq,gbcdPar-method
###   getAllSeq,hadaPar-method getAllSeq,mpPar-method
###   getAllSeq,pbrPar-method getAllSeq,rarPar-method
###   getAllSeq,tbdPar-method getAllSeq,udPar-method

### ** Examples

# CR
myPar <- crPar(6)
getAllSeq(myPar)

# EBC
myPar <- ebcPar(6, 0.667)
getAllSeq(myPar)

# BSD
myPar <- bsdPar(6, 2)
getAllSeq(myPar)

# PBR
myPar <- pbrPar(c(4, 2))
getAllSeq(myPar)

# RAR
myPar <- rarPar(8)
getAllSeq(myPar)

# MP 
myPar <- mpPar(8, 2)
getAllSeq(myPar)

# HAD
myPar <- hadaPar(8)
getAllSeq(myPar)

# TBD
myPar <- tbdPar(8)
getAllSeq(myPar)

# GBCD
myPar <- gbcdPar(8, 2)
getAllSeq(myPar)

# ABCD
myPar <- abcdPar(8, 3)
getAllSeq(myPar)

# BBCD
myPar <- bbcdPar(8, 5)
getAllSeq(myPar)

# CHEN
myPar <- chenPar(8, 2, 0.667)
getAllSeq(myPar)




