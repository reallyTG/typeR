library(vowels)


### Name: vowelplot
### Title: Plot Vowels in F1~F2 Space
### Aliases: vowelplot add.vowelplot add.spread.vowelplot setup.axes
###   setup.point.color setup.point.shape setup.sizes default.point.colors
### Keywords: hplot

### ** Examples
 
data(ohiovowels)
vowelplot(ohiovowels, color="vowels", label="vowels")

vowelplot(norm.bark(ohiovowels), speaker="JOHG09", color="vowels",
 color.choice=rainbow(length(unique(ohiovowels[,2]))), label="none", 
title="JOHG09 Bark Difference Normalized Vowels")
add.spread.vowelplot(norm.bark(ohiovowels), speaker="JOHG09", sd.mult=1,
 color.choice=rainbow(length(unique(ohiovowels[,2]))), color="vowels", leg=TRUE)

par(mfrow=c(2,1))
vowelplot(compute.means(ohiovowels), shape="vowels")
vowelplot(compute.means(norm.lobanov(ohiovowels)), shape="vowels")

par(mfrow=c(1,1))
g09.means <- compute.means(ohiovowels, speaker="JOHG09")
vowelplot(g09.means, color="vowels", labels="none")
add.spread.vowelplot(ohiovowels, speaker="JOHG09", sd.mult=1, color="vowels", labels="none")
# can add annotations to the vowel plots as any other R graph, eg:
legend("top", legend="Can you guess which vowel is 'BOY'?", col='lightslategrey', bty="n")

vowelplot(norm.nearey(ohiovowels), speaker="JOHG09", color="speakers", labels="vowels",
 title="Individual vowels and means for JOHG09\nNearey1 Normalized")
add.vowelplot(compute.means(norm.nearey(ohiovowels), speaker="JOHG09"), color=NA, size=2,
 labels="vowels")

vowelplot(norm.wattfabricius(ohiovowels), speaker="JOHG09", shape="vowels", color="vowels",
 color.choice=sample(colors(), length(unique(ohiovowels[,2]))), leg="vowels",
 title="Randomly colored vowels for JOHG09\nWatt & Fabricious normalized")



