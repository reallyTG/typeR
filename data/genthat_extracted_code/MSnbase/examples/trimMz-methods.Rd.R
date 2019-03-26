library(MSnbase)


### Name: trimMz-methods
### Title: Trims 'MSnExp' or 'Spectrum' instances
### Aliases: trimMz-methods trimMz filterMz filterMz-methods
### Keywords: methods

### ** Examples

mz <- 1:100
sp1 <- new("Spectrum2",
           mz = mz,
           intensity = abs(rnorm(length(mz))))

sp2 <- trimMz(sp1, c(25, 75))
range(mz(sp1))
range(mz(sp2))

data(itraqdata)
itraqdata2 <- filterMz(itraqdata, c(113, 117))
range(mz(itraqdata))
range(mz(itraqdata2))
processingData(itraqdata2)



