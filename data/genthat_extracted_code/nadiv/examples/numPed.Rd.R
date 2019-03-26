library(nadiv)


### Name: numPed
### Title: Integer Format Pedigree
### Aliases: numPed is.numPed ronPed is.numPed ronPed

### ** Examples


(nPed <- numPed(Mrode2))
is(nPed)

# re-order and retain class 'numPed'
ronPed(nPed, order(nPed[, 2], nPed[, 3]))
is(nPed)




