library(epicontacts)


### Name: get_degree
### Title: Find node degree for epicontacts objects
### Aliases: get_degree

### ** Examples

## make epicontacts object
if (require(outbreaks)) {
x <- make_epicontacts(ebola_sim$linelist, ebola_sim$contacts,
                       id="case_id", to="case_id", from="infector",
                       directed=TRUE)
x

## compute in-degree
deg_in <- get_degree(x)
table(deg_in)

## compute out-degree
deg_out <- get_degree(x, "out")
barplot(table(deg_out), main = "Reproduction number distribution")
mtext(side = 3, "(based on case out-degree)")

}




