library(colordistance)


### Name: getKMeanColors
### Title: Fit pixels to clusters using KMeans clustering
### Aliases: getKMeanColors

### ** Examples

colordistance::getKMeanColors(system.file("extdata",
"Heliconius/Heliconius_B/Heliconius_07.jpeg", package="colordistance"), n=3,
return.clust=FALSE, lower=rep(0.8, 3), upper=rep(1, 3))



