library(knitr)


### Name: opts_knit
### Title: Options for the knitr package
### Aliases: opts_knit
### Keywords: datasets

### ** Examples

opts_knit$get("verbose")
opts_knit$set(verbose = TRUE)  # change it
if (interactive()) {
    # for unnamed chunks, use 'fig' as the figure prefix
    opts_knit$set(unnamed.chunk.label = "fig")
    knit("001-minimal.Rmd")  # from https://github.com/yihui/knitr-examples
}



