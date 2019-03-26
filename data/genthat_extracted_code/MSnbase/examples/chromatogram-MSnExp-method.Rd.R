library(MSnbase)


### Name: chromatogram,MSnExp-method
### Title: Extract chromatogram object(s)
### Aliases: chromatogram,MSnExp-method chromatogram

### ** Examples

## Read a test data file.
library(msdata)
f <- c(system.file("microtofq/MM14.mzML", package = "msdata"),
     system.file("microtofq/MM8.mzML", package = "msdata"))

## Read the data as an MSnExp
msd <- readMSData(f, msLevel = 1)

## Extract the total ion chromatogram for each file:
tic <- chromatogram(msd)

tic

## Extract the TIC for the second file:
tic[1, 2]

## Plot the TIC for the first file
plot(rtime(tic[1, 1]), intensity(tic[1, 1]), type = "l",
    xlab = "rtime", ylab = "intensity", main = "TIC")

## Extract chromatograms for a MS data slices defined by retention time
## and mz ranges.
rtr <- rbind(c(10, 60), c(280, 300))
mzr <- rbind(c(140, 160), c(300, 320))
chrs <- chromatogram(msd, rt = rtr, mz = mzr)

## Each row of the returned Chromatograms object corresponds to one mz-rt
## range. The Chromatogram for the first range in the first file is empty,
## because the retention time range is outside of the file's rt range:
chrs[1, 1]

## The mz and/or rt ranges used are provided as featureData of the object
fData(chrs)

## The mz method can be used to extract the m/z ranges directly
mz(chrs)

## Also the Chromatogram for the second range in the second file is empty
chrs[2, 2]

## Get the extracted chromatogram for the first range in the second file
chr <- chrs[1, 2]
chr

plot(rtime(chr), intensity(chr), xlab = "rtime", ylab = "intensity")



