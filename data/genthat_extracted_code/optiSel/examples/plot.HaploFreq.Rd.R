library(optiSel)


### Name: plot.HaploFreq
### Title: Plots Frequencies of Haplotype Segments in Specified Breeds
### Aliases: plot.HaploFreq

### ** Examples

data(map)
data(Cattle)
dir   <- system.file("extdata", package="optiSel")
files <- paste(dir, "/Chr", 1:2, ".phased", sep="")

Freq <- freqlist(
  haplofreq(files, Cattle, map, thisBreed="Angler", refBreeds="Rotbunt",   minSNP=20),
  haplofreq(files, Cattle, map, thisBreed="Angler", refBreeds="Holstein",  minSNP=20),
  haplofreq(files, Cattle, map, thisBreed="Angler", refBreeds="Fleckvieh", minSNP=20)
  )

names(Freq)

plot(Freq, ID=1, hap=2, refBreed="Rotbunt")

Freq <- haplofreq(files, Cattle, map, thisBreed="Angler", refBreeds="others",   minSNP=20)

plot(Freq, ID=1, hap=2)
plot(Freq, ID=1, hap=2, show.maxFreq=TRUE)

Freq <- haplofreq(files, Cattle, map, thisBreed="Angler", refBreeds="Angler",   minSNP=20)
plot(Freq, ID=1, hap=2)




