library(HH)


### Name: bivariateNormal
### Title: Plot the bivariate normal density using wireframe for specified
###   rho.
### Aliases: bivariateNormal
### Keywords: hplot shiny

### ** Examples

bv8 <- bivariateNormal(.7)  ## all views on one page
bv8
update(bv8[3], layout=c(1,1)) ## one panel
## Not run: 
##D   shiny::runApp(file.path(system.file(package="HH"), "shiny/bivariateNormal")) ## 3D
##D   shiny::runApp(system.file("shiny/bivariateNormalScatterplot", package="HH")) ## scatterplota
## End(Not run)



