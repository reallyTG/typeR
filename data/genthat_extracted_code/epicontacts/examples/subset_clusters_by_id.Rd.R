library(epicontacts)


### Name: subset_clusters_by_id
### Title: Subset epicontacts by case-specified clusters
### Aliases: subset_clusters_by_id

### ** Examples

if (require(outbreaks)) {
## build data
x <- make_epicontacts(ebola_sim$linelist, ebola_sim$contacts,
                       id="case_id", to="case_id", from="infector",
                       directed=TRUE)


id <- "cac51e" ## it can be a vector of id as well


## subset based on cluster to which "cac51e" belongs
x_subset <- subset_clusters_by_id(x, id)

}



