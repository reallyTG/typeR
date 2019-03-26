library(epicontacts)


### Name: get_id
### Title: Access unique identifiers in epicontacts objects
### Aliases: get_id

### ** Examples


if (require(outbreaks)) {
## build data
x <- make_epicontacts(ebola_sim$linelist, ebola_sim$contacts,
                       id="case_id", to="case_id", from="infector",
                       directed=TRUE)

## get identifiers
id1 <- get_id(x, "linelist")
id2 <- get_id(x, "contacts")
id3 <- get_id(x, "all")
id4 <- get_id(x, "common")

## check intersections and unions
all.equal(union(id1, id2), id3)
all.equal(intersect(id1, id2), id4)

}




