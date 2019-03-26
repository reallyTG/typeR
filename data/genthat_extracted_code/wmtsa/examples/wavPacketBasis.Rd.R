library(wmtsa)


### Name: wavPacketBasis
### Title: Extract wavelet packet basis from a DWPT
### Aliases: wavPacketBasis
### Keywords: univar

### ** Examples

## calculate a 3-level DWPT of the sunspots series 
W <- wavDWPT(sunspots, n.level=3)

## extract the level 1 basis 
W12 <- wavPacketBasis(W, 1:2)

## obtain the names of the crystals that were 
## extracted: "w1.0" "w1.1" 
names(W12$data)

## extract basis corresponding to crystal set: 
## "w2.0" "w2.1" "w1.1". This set comprises a 
## split-level basis 
Wsplit <- wavPacketBasis(W, c(3,4,2))
names(Wsplit$data)



