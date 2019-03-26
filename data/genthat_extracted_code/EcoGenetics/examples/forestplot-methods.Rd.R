library(EcoGenetics)


### Name: eco.forestplot
### Title: Forestplot graphs
### Aliases: eco.forestplot eco.forestplot,generic-method
###   eco.forestplot,eco.lsa-method eco.forestplot,dataframeORmatrix-method

### ** Examples

## Not run: 
##D 
##D require(ggplot2)
##D # simulated confidence intervals for the null hypotesis of a variable "a"
##D set.seed(8)
##D a<-runif(10, -2, 2)
##D infer <- runif(10, -1, 1)
##D super <- runif(10, -1, 1)
##D infer2 <- pmin(infer, super)
##D super2 <- pmax(infer, super)
##D data <- data.frame(a, infer2, super2)
##D forest <- eco.forestplot(data)
##D forest
##D 
##D # the forestplot method support the use of ggplot2 syntax with ggplot2 graphs
##D forest <- eco.forestplot(data, interactivePlot = FALSE)
##D forest <- forest + theme_bw() + theme(legend.position="none")
##D forest
## End(Not run)





