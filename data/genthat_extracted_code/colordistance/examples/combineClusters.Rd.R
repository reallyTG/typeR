library(colordistance)


### Name: combineClusters
### Title: Average 3D color histograms by subdirectory
### Aliases: combineClusters

### ** Examples

combined_clusters <- colordistance::combineClusters(system.file("extdata",
"Heliconius", package="colordistance"), method="median", bins=2,
lower=rep(0.8, 3), upper=rep(1, 3))



