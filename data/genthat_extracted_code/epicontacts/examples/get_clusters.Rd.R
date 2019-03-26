library(epicontacts)


### Name: get_clusters
### Title: Assign cluster IDs to epicontacts data
### Aliases: get_clusters

### ** Examples

if (require(outbreaks)) {
## build data
x <- make_epicontacts(ebola_sim$linelist, ebola_sim$contacts,
                       id = "case_id",
                       to = "case_id",
                       from = "infector",
                       directed = TRUE)


## add cluster membership and sizes to epicontacts 'linelist'
y <- get_clusters(x, output = "epicontacts")
y

## return a data.frame with linelist member ids and cluster memberships as
## factors
z <- get_clusters(x, output = "data.frame")
head(z)

}



