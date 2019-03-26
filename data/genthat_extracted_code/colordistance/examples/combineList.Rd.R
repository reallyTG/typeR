library(colordistance)


### Name: combineList
### Title: Combine a list of cluster features into a single cluster set
### Aliases: combineList

### ** Examples

hist_list <- getHistList(system.file("extdata", "Heliconius/Heliconius_A",
package="colordistance"), lower=rep(0.8, 3), upper=rep(1, 3))
median_clusters <- combineList(hist_list, method="median")




