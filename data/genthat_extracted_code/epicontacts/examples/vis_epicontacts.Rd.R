library(epicontacts)


### Name: vis_epicontacts
### Title: Plot epicontacts objects using visNetwork
### Aliases: vis_epicontacts

### ** Examples

if (require(outbreaks)) {

## example using MERS outbreak in Korea, 2014
head(mers_korea_2015[[1]])
head(mers_korea_2015[[2]])

x <- make_epicontacts(linelist=mers_korea_2015[[1]],
                       contacts = mers_korea_2015[[2]],
                       directed=TRUE)

## Not run: 
##D plot(x)
##D plot(x, node_color = "place_infect")
##D plot(x, node_color = "loc_hosp", legend_max=20, annot=TRUE)
##D plot(x, "place_infect", node_shape = "sex",
##D      shapes = c(M = "male", F = "female"))
##D 
##D plot(x, "sex", node_shape = "sex", shapes = c(F = "female", M = "male"),
##D      edge_label = "exposure", edge_color = "exposure")
## End(Not run)
}



