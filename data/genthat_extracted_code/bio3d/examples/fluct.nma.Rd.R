library(bio3d)


### Name: fluct.nma
### Title: NMA Fluctuations
### Aliases: fluct.nma
### Keywords: analysis

### ** Examples

## Fetch stucture
pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )

## Calculate (vibrational) normal modes
modes <- nma(pdb)

## Fluctuations
f <- fluct.nma(modes)

## Fluctuations of first non-trivial mode
f <- fluct.nma(modes, mode.inds=c(7,8))



