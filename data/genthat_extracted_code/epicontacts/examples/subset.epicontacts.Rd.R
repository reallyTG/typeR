library(epicontacts)


### Name: subset.epicontacts
### Title: Subset an epicontact object by factors
### Aliases: subset.epicontacts

### ** Examples

if (require(outbreaks)) {
## build data

x <- make_epicontacts(ebola_sim$linelist, ebola_sim$contacts,
                      id = "case_id", to = "case_id",
                      from = "infector", directed = FALSE)

## subset based on node and edge attributes
x_subset <- subset(x, node_attribute = list("gender" = "f"),
                   edge_attribute = list("source" = "funeral"))


## subset a cluster connected to a given id
## (can be a vector of ids as well)
## here picking node with highest out-degree

id <- names(which.max(get_degree(x, "out")))
x_subset <- thin(subset(x, cluster_id = id), 2)
x_subset
plot(x_subset)


## subset based on cluster size range

x_subset <- subset(x, cs_min = 12, cs_max = 15)


## subset based on single cluster size

x_subset <- subset(x, cs = 12)


## subset based on minimum cluster size

x_subset <- subset(x, cs_min = 10)


## subset based on maximum cluster size

x_subset <- subset(x, cs_max = 9)


}



