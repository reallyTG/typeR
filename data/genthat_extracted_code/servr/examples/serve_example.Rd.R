library(servr)


### Name: serve_example
### Title: A convenience function to serve examples in this package
### Aliases: serve_example

### ** Examples

# R Markdown v1 or v2
servr::serve_example("rmd", servr::rmdv1)
servr::serve_example("rmd", servr::rmdv2)

# GNU Make
servr::serve_example("make1", servr::make)
servr::serve_example("make2", servr::make)



