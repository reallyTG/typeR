library(miniCRAN)


### Name: plot.pkgDepGraph
### Title: Plots a package dependency graph.
### Aliases: plot.pkgDepGraph

### ** Examples

tags <- "chron"

# Plot using defaults
pdb <- cranJuly2014

## Not run: 
##D   pdb <- pkgAvail(
##D     repos = c(CRAN = getOption("minicran.mran")),
##D     type = "source"
##D   )
## End(Not run)

dg <- makeDepGraph(tags, availPkgs = pdb  , includeBasePkgs = FALSE,
                   suggests = TRUE, enhances = TRUE)

set.seed(42);
plot(dg)

# Move edge legend to top left
set.seed(42);
plot(dg, legendPosition = c(-1, 1))

# Change font size and shape size
set.seed(42);
plot(dg, legendPosition = c(-1, 1), vertex.size = 20,  cex = 0.5)


# Move vertex legend to top right
set.seed(42);
plot(dg, legendPosition = c(1, 1), vertex.size = 20,  cex = 0.5)




