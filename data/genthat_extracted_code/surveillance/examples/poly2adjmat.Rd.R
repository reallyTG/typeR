library(surveillance)


### Name: poly2adjmat
### Title: Derive Adjacency Structure of '"SpatialPolygons"'
### Aliases: poly2adjmat
### Keywords: spatial graphs

### ** Examples

if (requireNamespace("spdep")) {
    ## generate adjacency matrix for districts of Bayern and Baden-Wuerttemberg
    data("fluBYBW")
    adjmat <- poly2adjmat(fluBYBW@map)

    ## same as already stored in the neighbourhood slot (in different order)
    stopifnot(all.equal(adjmat,
                        neighbourhood(fluBYBW)[rownames(adjmat),colnames(adjmat)]))

    ## a visual check of the district-specific number of neighbours
    plot(fluBYBW@map)
    text(coordinates(fluBYBW@map), labels=rowSums(adjmat==1), font=2, col=2)

    ## the neighbourhood graph can be plotted with spdep
    plot(spdep::mat2listw(adjmat), coordinates(fluBYBW@map))
}



