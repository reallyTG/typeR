library(rbundler)


### Name: create_package_description
### Title: A Utility function for creating rbundler scenarios.
### Aliases: create_package_description

### ** Examples

name <- 'simpledependency'
title <- 'A mock package with a single dependency.'
dependencies <- data.frame(type = c('Depends', 'Suggests'), package=c('foo', 'bar'),
                           compare=c(NA, '=='), version=c(NA, '1'))
description <- create_package_description(name, title, dependencies)

write(description, file='') # Write the output to the console



