library(TAM)


### Name: designMatrices
### Title: Generation of Design Matrices
### Aliases: designMatrices print.designMatrices designMatrices.mfr
###   designMatrices.mfr2 .A.matrix rownames.design .A.PCM2 .A.PCM3
### Keywords: Design matrices

### ** Examples

###########################################################
# different parametrizations for ordered data
data( data.gpcm )
resp <- data.gpcm

# parametrization for partial credit model
A1 <- TAM::designMatrices( resp=resp )$A
# item difficulty and threshold parametrization
A2 <- TAM::.A.PCM2( resp )
# dispersion model of Andrich (1982)
A3 <- TAM::.A.PCM3( resp )
# rating scale model
A4 <- TAM::designMatrices( resp=resp, modeltype="RSM" )$A



