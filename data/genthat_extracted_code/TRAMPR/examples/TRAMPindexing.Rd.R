library(TRAMPR)


### Name: TRAMPindexing
### Title: Index (Subset) TRAMPsamples and TRAMPknowns Objects
### Aliases: TRAMPindexing [.TRAMPknowns [.TRAMPsamples
### Keywords: array methods

### ** Examples

data(demo.samples)
data(demo.knowns)

## Subsetting by sample.fk values
labels(demo.samples)
demo.samples[c(101, 102, 110)]
labels(demo.samples[c(101, 102, 110)])

## Take just samples from the first 10 soilcores:
demo.samples[demo.samples$info$soilcore.fk <= 10]

## Indexing also works on TRAMPknowns:
demo.knowns[733]
labels(demo.knowns[733])



