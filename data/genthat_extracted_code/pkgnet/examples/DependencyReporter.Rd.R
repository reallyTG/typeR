library(pkgnet)


### Name: DependencyReporter
### Title: Package Dependency Reporter Class
### Aliases: DependencyReporter
### Keywords: datasets

### ** Examples

## No test: 

# Instantiate an object
reporter <- DependencyReporter$new()

# Seed it with a package
reporter$set_package("ggplot2")

# plot it up
reporter$plot_network()
## End(No test)



