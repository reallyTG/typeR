library(lfstat)


### Name: readlfdata
### Title: Reads data sheets
### Aliases: readlfdata

### ** Examples

# Finding the filename of the sample file on your computer
fn <- system.file("samplesheets/9104020.day", package = "lfstat")
grdc <- readlfdata(fn, type = "GRDC", baseflow = FALSE, hyearstart = 1)
head(grdc)


fn <- system.file("samplesheets/kloesterle.dat", package = "lfstat")
hzb <- readlfdata(fn, type = "HZB", baseflow = FALSE, hyearstart = 1)
head(hzb)

fn <- system.file("samplesheets/oberammergau.dat", package = "lfstat")
lfu <- readlfdata(fn, type = "LFU", baseflow = FALSE, hyearstart = 1)
head(lfu)



