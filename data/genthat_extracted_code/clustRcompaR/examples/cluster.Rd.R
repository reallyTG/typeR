library(clustRcompaR)


### Name: cluster
### Title: Cluster wrapper function
### Aliases: cluster

### ** Examples

library(clustRcompaR)
library(dplyr)
library(quanteda)

d <- inaugural_addresses
d <- mutate(d, century = ifelse(Year < 1800, "17th",
                                ifelse(Year >= 1800 & Year < 1900, "18th",
                                       ifelse(Year >= 1900 & Year < 2000, "19th", "20th"))))

three_clusters <- cluster(d, century, n_clusters = 3)
extract_terms(three_clusters)

three_clusters_comparison <- compare(three_clusters, "century")
compare_plot(three_clusters_comparison)



