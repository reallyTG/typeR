library(tuneR)


### Name: readWave
### Title: Reading Wave files
### Aliases: readWave
### Keywords: IO file

### ** Examples

Wobj <- sine(440)

tdir <- tempdir()
tfile <- file.path(tdir, "myWave.wav")
writeWave(Wobj, filename = tfile)
list.files(tdir, pattern = "\\.wav$")
newWobj <- readWave(tfile)
newWobj
file.remove(tfile)



