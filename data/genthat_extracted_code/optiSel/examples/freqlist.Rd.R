library(optiSel)


### Name: freqlist
### Title: Combines Objects Computed with Function haplofreq() into a List
### Aliases: freqlist

### ** Examples

data(map)
data(Cattle)
dir   <- system.file("extdata", package="optiSel")
files <- paste(dir, "/Chr", 1:2, ".phased", sep="")

Freq <- freqlist(
 haplofreq(files, Cattle, map, thisBreed="Angler", refBreeds="Rotbunt",   minL=2.0),
 haplofreq(files, Cattle, map, thisBreed="Angler", refBreeds="Holstein",  minL=2.0),
 haplofreq(files, Cattle, map, thisBreed="Angler", refBreeds="Fleckvieh", minL=2.0)
  )

#The component names are the reference breeds by default:
names(Freq)

plot(Freq, ID=1, hap=2, refBreed="Rotbunt")

plot(Freq, ID=1, hap=2, refBreed="Holstein", Chr=1)




