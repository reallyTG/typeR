library(TraMineRextras)


### Name: seqimplic
### Title: Position wise group-typical states
### Aliases: seqimplic print.seqimplic plot.seqimplic

### ** Examples

data(mvad)

## Building a state sequence object
mvad.seq <- seqdef(mvad, 17:86)
## Sequence of typical states
mvad.si.gcse5eq <- seqimplic(mvad.seq, group=mvad$gcse5eq)

##Plotting the typical states
plot(mvad.si.gcse5eq, lwd=3, conf.level=c(0.95, 0.99))

## Printing the results
print(mvad.si.gcse5eq, xtstep=12)



