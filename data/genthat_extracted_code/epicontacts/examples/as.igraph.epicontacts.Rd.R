library(epicontacts)


### Name: as.igraph.epicontacts
### Title: Create igraph object from contact data
### Aliases: as.igraph.epicontacts

### ** Examples


if (require(outbreaks) && require(igraph)) {
## build data

x <- make_epicontacts(ebola_sim$linelist, ebola_sim$contacts,
                      id = "case_id", to = "case_id", from ="infector",
                      directed = TRUE)


## subset data - keep 50 cases from linelist with contacts

ids <- get_id(x, "common")[1:50]
ids
x <- x[ids, ids]


## make igraph object with associated attributes from epicontacts object

net <- as.igraph(x)
net
plot(net, vertex.label = "", vertex.size = 10,
     vertex.color = cases_pal(50))
}



