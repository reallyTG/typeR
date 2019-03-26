library(bio3d)


### Name: sip
### Title: Square Inner Product
### Aliases: sip sip.default sip.nma sip.enma
### Keywords: utilities

### ** Examples


pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )
a <- nma(pdb)
b <- nma(pdb, ff="anm")

sip(a$fluctuations, b$fluctuations)




