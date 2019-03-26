library(SobolSequence)


### Name: SobolSequence-package
### Title: Sobol Sequence
### Aliases: SobolSequence-package sobolsequence

### ** Examples

srange <- sobolSequence.dimMinMax()
mrange <- sobolSequence.dimF2MinMax(srange[1])
points <- sobolSequence.points(dimR=srange[1], dimF2=mrange[1], count=10000)
points <- sobolSequence.points(dimR=srange[1], dimF2=mrange[1], count=10000,
                               digitalShift=TRUE)



