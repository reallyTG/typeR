library(btergm)


### Name: marginalplot
### Title: Plot marginal effects for two-way interactions in ERGMs
### Aliases: marginalplot
### Keywords: marginal effects interpretation

### ** Examples

## Not run: 
##D # data preparation
##D data("florentine")
##D n <- network.size(flobusiness)
##D wealth <- get.vertex.attribute(flobusiness, "wealth")
##D priorates <- get.vertex.attribute(flobusiness, "priorates")
##D wealth.icov <- matrix(rep(wealth, n), ncol = n, byrow = TRUE)
##D priorates.icov <- matrix(rep(priorates, n), ncol = n, byrow = TRUE)
##D interac <- wealth.icov * priorates.icov
##D 
##D # estimate model with interaction effect
##D model <- ergm(flobusiness ~ edges + esp(1) + edgecov(wealth.icov) 
##D               + edgecov(priorates.icov) + edgecov(interac))
##D 
##D # plot the interaction (note the additional optional ggplot2 elements)
##D marginalplot(model, var1 = "edgecov.wealth.icov", 
##D     var2 = "edgecov.priorates.icov", inter = "edgecov.interac", 
##D     color = "darkred", rug = TRUE, point = FALSE, xlab = "Priorates", 
##D     ylab = "Wealth") + theme_bw() + ggtitle("Interaction effect")
## End(Not run)



