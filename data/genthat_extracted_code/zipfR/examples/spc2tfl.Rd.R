library(zipfR)


### Name: spc2tfl
### Title: Convert Between Frequency Spectra and Type Frequency Lists
###   (zipfR)
### Aliases: spc2tfl tfl2spc
### Keywords: manip

### ** Examples


## Brown tfl and spc
data(Brown.tfl)
data(Brown.spc)


## a spectrum from a tfl
Brown.spc2 <- tfl2spc(Brown.tfl)

## identical to Brown.spc:
summary(Brown.spc)
summary(Brown.spc2)

tail(Brown.spc)
tail(Brown.spc2)


## a tfl from a spectrum
Brown.tfl2 <- spc2tfl(Brown.spc)

## same frequency information as Brown.tfl
## but with different ids and no type labels
summary(Brown.tfl)
summary(Brown.tfl2)

print(Brown.tfl2)
print(Brown.tfl)




