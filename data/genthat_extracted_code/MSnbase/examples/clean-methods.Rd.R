library(MSnbase)


### Name: clean-methods
### Title: Clean 'MSnExp', 'Spectrum' or 'Chromatogram' instances
### Aliases: clean-methods clean
### Keywords: methods

### ** Examples

int <- c(1,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0)
sp1 <- new("Spectrum2",
           intensity=int,
           mz=1:length(int))
sp2 <- clean(sp1) ## default is all=FALSE
intensity(sp1)
intensity(sp2)
intensity(clean(sp1, all = TRUE))

mz(sp1)
mz(sp2)
mz(clean(sp1, all = TRUE))

data(itraqdata)
itraqdata2 <- clean(itraqdata)
sum(peaksCount(itraqdata))
sum(peaksCount(itraqdata2))
processingData(itraqdata2)

## Create a simple Chromatogram object
chr <- Chromatogram(rtime = 1:12,
                    intensity = c(0, 0, 20, 0, 0, 0, 123, 124343, 3432, 0, 0, 0))

## Remove 0-intensity values keeping those adjacent to peaks
chr <- clean(chr)
intensity(chr)

## Remove all 0-intensity values
chr <- clean(chr, all = TRUE)
intensity(chr)

## Clean a Chromatogram with NAs.
chr <- Chromatogram(rtime = 1:12,
                    intensity = c(0, 0, 20, NA, NA, 0, 123, 124343, 3432, 0, 0, 0))
chr <- clean(chr, all = FALSE, na.rm = TRUE)
intensity(chr)




