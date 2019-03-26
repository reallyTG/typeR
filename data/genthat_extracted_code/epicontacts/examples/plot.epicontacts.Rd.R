library(epicontacts)


### Name: plot.epicontacts
### Title: Plot epicontacts objects
### Aliases: plot.epicontacts

### ** Examples

if (require(outbreaks)) {
## example using MERS outbreak in Korea, 2014
head(mers_korea_2015[[1]])
head(mers_korea_2015[[2]])

x <- make_epicontacts(linelist = mers_korea_2015[[1]],
                      contacts = mers_korea_2015[[2]], directed=TRUE)

## Not run: 
##D plot(x)
##D plot(x, "place_infect")
##D plot(x, "loc_hosp", legend_max = 20, annot = TRUE)
##D plot(x, "place_infect", node_shape = "sex",
##D      shapes = c(M = "male", F = "female"))
##D plot(x, 4)
##D plot(x, 4, method = "graph3D")
## End(Not run)
}



