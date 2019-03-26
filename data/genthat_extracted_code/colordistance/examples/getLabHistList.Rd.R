library(colordistance)


### Name: getLabHistList
### Title: Generate a list of cluster sets in CIE Lab color space
### Aliases: getLabHistList

### ** Examples

images <- system.file("extdata", "Heliconius/Heliconius_B",
package="colordistance")

colordistance::getLabHistList(images, bins = 2, sample.size = 1000, ref.white
= "D65", plotting = TRUE, pausing = FALSE, lower = rep(0.8, 3), upper =
rep(1, 3), a.bounds = c(-100, 100), b.bounds = c(-127, 100), ylim = c(0, 1))



