library(vowels)


### Name: compute.means
### Title: Compute the Formant Means (or Medians or Standard Deviations) of
###   a Data Frame of Vowel Data
### Aliases: compute.means compute.medians compute.sds
### Keywords: methods

### ** Examples
 
data(ohiovowels)
means <- compute.means(ohiovowels)
vowelplot(means, color="vowels", labels="vowels")

ohd.means <- compute.means(ohiovowels, speaker="OHDMTV_M")
vowelplot(ohd.means, color="vowels", labels="none")
add.spread.vowelplot(ohiovowels, speaker="OHDMTV_M", color="vowels", sd.mult=1)



