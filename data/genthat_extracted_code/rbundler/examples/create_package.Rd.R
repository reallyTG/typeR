library(rbundler)


### Name: create_package
### Title: Creates a package matching the given description and
###   dependencies.
### Aliases: create_package

### ** Examples

# Create a simple package with no dependencies:
path <- tempdir()
name <- 'simplepackage'
package <- create_package(name, 'A simple mock package', data.frame(), path)



