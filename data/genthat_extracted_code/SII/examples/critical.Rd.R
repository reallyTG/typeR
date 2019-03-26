library(SII)


### Name: critical
### Title: Constants Tables for ANSI S3.5-1997 Speech Intelligibility Index
###   (SII)
### Aliases: critical equal onethird octave overall.spl
### Keywords: datasets

### ** Examples

data(critical)
critical # show entire table

data(equal)
names(equal)
equal$fi # extract just the frequency band centers

data(onethird)
barplot(onethird$Ii) # plot band importance function (weights)

data(octave)
round(octave, digits=2) # just 2 digits

data(overall.spl)
overall.spl



