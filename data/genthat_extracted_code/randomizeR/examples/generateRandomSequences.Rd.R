library(randomizeR)


### Name: generateRandomSequences
### Title: Generate random sequences
### Aliases: generateRandomSequences genSeq
###   genSeq,abcdPar,numeric,numeric-method
###   genSeq,abcdPar,numeric,missing-method
###   genSeq,abcdPar,missing,numeric-method
###   genSeq,abcdPar,missing,missing-method
###   genSeq,bbcdPar,numeric,numeric-method
###   genSeq,bbcdPar,numeric,missing-method
###   genSeq,bbcdPar,missing,numeric-method
###   genSeq,bbcdPar,missing,missing-method
###   genSeq,ebcPar,numeric,numeric-method
###   genSeq,ebcPar,missing,numeric-method
###   genSeq,ebcPar,numeric,missing-method
###   genSeq,ebcPar,missing,missing-method
###   genSeq,bsdPar,numeric,numeric-method
###   genSeq,bsdPar,numeric,missing-method
###   genSeq,bsdPar,missing,numeric-method
###   genSeq,bsdPar,missing,missing-method
###   genSeq,chenPar,numeric,numeric-method
###   genSeq,chenPar,numeric,missing-method
###   genSeq,chenPar,missing,numeric-method
###   genSeq,chenPar,missing,missing-method
###   genSeq,crPar,numeric,numeric-method
###   genSeq,crPar,missing,numeric-method
###   genSeq,crPar,numeric,missing-method
###   genSeq,crPar,missing,missing-method
###   genSeq,gbcdPar,numeric,numeric-method
###   genSeq,gbcdPar,numeric,missing-method
###   genSeq,gbcdPar,missing,numeric-method
###   genSeq,gbcdPar,missing,missing-method
###   genSeq,hadaPar,numeric,numeric-method
###   genSeq,hadaPar,missing,numeric-method
###   genSeq,hadaPar,numeric,missing-method
###   genSeq,hadaPar,missing,missing-method
###   genSeq,mpPar,numeric,numeric-method
###   genSeq,mpPar,missing,numeric-method
###   genSeq,mpPar,numeric,missing-method
###   genSeq,mpPar,missing,missing-method
###   genSeq,pbrPar,missing,numeric-method
###   genSeq,pbrPar,numeric,numeric-method
###   genSeq,pbrPar,missing,missing-method
###   genSeq,pbrPar,numeric,missing-method
###   genSeq,rarPar,numeric,numeric-method
###   genSeq,rarPar,missing,numeric-method
###   genSeq,rarPar,numeric,missing-method
###   genSeq,rarPar,missing,missing-method
###   genSeq,rpbrPar,missing,numeric-method
###   genSeq,rpbrPar,numeric,numeric-method
###   genSeq,rpbrPar,missing,missing-method
###   genSeq,rpbrPar,numeric,missing-method
###   genSeq,tbdPar,numeric,numeric-method
###   genSeq,tbdPar,missing,numeric-method
###   genSeq,tbdPar,numeric,missing-method
###   genSeq,tbdPar,missing,missing-method
###   genSeq,rtbdPar,numeric,numeric-method
###   genSeq,rtbdPar,missing,numeric-method
###   genSeq,rtbdPar,numeric,missing-method
###   genSeq,rtbdPar,missing,missing-method
###   genSeq,udPar,numeric,numeric-method
###   genSeq,udPar,missing,numeric-method
###   genSeq,udPar,numeric,missing-method
###   genSeq,udPar,missing,missing-method

### ** Examples

# CR
myPar <- crPar(10)
genSeq(myPar, 4)
genSeq(myPar)

# EBC
myPar <- ebcPar(10, 0.667)
genSeq(myPar, 4)
genSeq(myPar)

# BSD
myPar <- bsdPar(10, 2)
genSeq(myPar, 4)
genSeq(myPar)

# PBR
myPar <- pbrPar(c(4, 4))
genSeq(myPar, 4)
genSeq(myPar)

# RAR
myPar <- rarPar(10)
genSeq(myPar, 4)
genSeq(myPar)

# MP 
myPar <- mpPar(10, 2)
genSeq(myPar, 4)
genSeq(myPar)

# HAD
myPar <- hadaPar(10)
genSeq(myPar, 4)
genSeq(myPar)

# UD
myPar <- udPar(8, 0, 1)
genSeq(myPar,4)
genSeq(myPar)

# TBD
myPar <- tbdPar(c(4, 6))
genSeq(myPar, 4)
genSeq(myPar)

# GBCD
myPar <- gbcdPar(8, 2)
genSeq(myPar, 4)
genSeq(myPar)

# ABCD
myPar <- abcdPar(8, 3)
genSeq(myPar, 4)
genSeq(myPar)

# BBCD
myPar <- bbcdPar(8, 5)
genSeq(myPar, 5)
genSeq(myPar)

# CHEN
myPar <- chenPar(8, 2, 0.667)
genSeq(myPar, 5)
genSeq(myPar)




