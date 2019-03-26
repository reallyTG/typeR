library(vowels)


### Name: vowels-package
### Title: VOWELS: Vowel Manipulation, Normalization, and Plotting Package
### Aliases: vowels-package vowels
### Keywords: hplot dplot misc methods

### ** Examples

# You can use load.vowels(), e.g. below, to load vowel data from a URL or a local file
# ohiovowels <- load.vowels("http://lingtools.uoregon.edu/downloads/CentralOhioNORM.txt")

# ohiovowels is "CentralOhioNORM.txt" file from NORM website, included in the package for examples
data(ohiovowels)
vowelplot(ohiovowels, color="vowels", label="vowels")

vowelplot(norm.bark(ohiovowels), speaker="JOHG09", color="vowels",
 color.choice=rainbow(length(unique(ohiovowels[,2]))), label="none",
 title="JOHG09 Bark Difference Normalized Vowels")
add.spread.vowelplot(norm.bark(ohiovowels), speaker="JOHG09", sd.mult=1,
 color.choice=rainbow(length(unique(ohiovowels[,2]))), color="vowels", leg=TRUE)

normed.vowels <- norm.lobanov(ohiovowels)
vowelplot(normed.vowels, speaker="JOHG09", shape="vowels")

vowelplot(norm.wattfabricius(ohiovowels), speaker="JOHG09", shape="vowels",
 color="vowels", color.choice=rainbow(length(unique(ohiovowels[,2]))), leg="vowels",
 title="Rainbow colored vowels for JOHG09\nWatt & Fabricious normalized")



