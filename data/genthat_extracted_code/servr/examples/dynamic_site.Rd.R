library(servr)


### Name: jekyll
### Title: Serve R Markdown based websites
### Aliases: jekyll rmdv2 rmdv1

### ** Examples

if (interactive()) servr::rmdv1()  # serve the current dir with R Markdown v1
if (interactive()) servr::rmdv2()  # or R Markdown v2

# built-in examples
servr::serve_example("rmd", servr::rmdv1)
servr::serve_example("rmd", servr::rmdv2)



