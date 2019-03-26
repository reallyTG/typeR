library(colordistance)


### Name: getLabHist
### Title: Generate a 3D histogram based on CIE Lab color coordinates in an
###   image
### Aliases: getLabHist

### ** Examples

path <- system.file("extdata", "Heliconius/Heliconius_B/Heliconius_07.jpeg",
package="colordistance")
getLabHist(path, ref.white = "D65", bins = c(2, 3, 3), lower = rep(0.8, 3),
upper = rep(1, 3), sample.size = 1000, ylim = c(0, 1))




