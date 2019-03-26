library(rggobi)


### Name: ggobi_display_get_tour_projection
### Title: Get tour projection
### Aliases: ggobi_display_get_tour_projection
### Keywords: dynamic

### ** Examples

if (interactive()) {
g <- ggobi(mtcars)
d <- displays(g)[[1]]
}
## Not run: 
##D pmode(d) <- "2D Tour"
##D ggobi_display_get_tour_projection(d)
##D variables(d) <- list(X=names(mtcars))
##D ggobi_display_get_tour_projection(d)
##D MASS::eqscplot(as.matrix(mtcars) %*% ggobi_display_get_tour_projection(d))
## End(Not run)


