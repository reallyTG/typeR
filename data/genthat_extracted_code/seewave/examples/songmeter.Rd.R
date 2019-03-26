library(seewave)


### Name: songmeter
### Title: Reading and interpreting SongMeter file name
### Aliases: songmeter
### Keywords: input data

### ** Examples

file1 <- "MNHN_20141225_234500.wav"   ## SM2 file
file2 <- "CNRS_0+1_20130824_153000.wav"  # SM3 file without geolocalisation
file3 <- "PARIS_-0-_20150410$195550.wav"  # SM3 file with geolocalisation
file4 <- "MNHN_20141225_234500.txt" # not a .wav or a .wac file
file5 <- "myfile.wav"  # not a Wildlife Acoustics filename
files <- c(file1, file2, file3, file4, file5)
songmeter(files)



