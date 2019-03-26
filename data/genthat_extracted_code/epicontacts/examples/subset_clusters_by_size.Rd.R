library(epicontacts)


### Name: subset_clusters_by_size
### Title: Subset clusters from epicontacts object by cluster size
### Aliases: subset_clusters_by_size

### ** Examples

if (require(outbreaks)) {
## build data
x <- make_epicontacts(ebola_sim$linelist, ebola_sim$contacts,
                       id="case_id", to="case_id", from="infector",
                       directed=TRUE)


## subset based on cluster size range
x_subset <- subset_clusters_by_size(x, cs_min = 12, cs_max = 15)


## subset based on single cluster size
x_subset <- subset_clusters_by_size(x, cs = 12)


## subset based on minimum cluster size
x_subset <- subset_clusters_by_size(x, cs_min = 10)


## subset based on maximum cluster size
x_subset <- subset_clusters_by_size(x, cs_max = 9)
}



