library(marelac)


### Name: AtomicWeight
### Title: The Atomic Weights of Chemical Elements
### Aliases: AtomicWeight atomicweight
### Keywords: datasets

### ** Examples

## assess the data in the IUPAC table (with all footnotes)
AtomicWeight[1:20,]
AtomicWeight[AtomicWeight$Symbol == "C",]

## use the lower case version for simple calculations:
atomicweight$C
with(atomicweight, C)

## it can also be used to calculate molecular weights
## via symbolic computation
with(atomicweight, H * 2 + O)



