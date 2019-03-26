library(rggobi)


### Name: ggobi_display_set_tour_projection
### Title: Set tour projection
### Aliases: ggobi_display_set_tour_projection
### Keywords: dynamic

### ** Examples

if (interactive()) {
g <- ggobi(mtcars)
d <- displays(g)[[1]]
}
## Not run: 
##D pmode(d) <- "2D Tour"
##D variables(d) <- list(X=names(mtcars))
##D ggobi_display_get_tour_projection(d)
##D pc <- princomp(as.matrix(mtcars))$loadings[,1:2]
##D ggobi_display_set_tour_projection(d, pc)
##D pc <- princomp(as.matrix(mtcars), cor=T)$loadings
##D ggobi_display_set_tour_projection(d, pc)[,1:2]
## End(Not run)


