library(knitr)


### Name: rocco
### Title: Knit R Markdown using the classic Docco style
### Aliases: rocco

### ** Examples

rocco_view = function(input) {
    if (!file.exists(input)) 
        return()
    o = rocco(input, header = "", quiet = TRUE)
    if (interactive()) 
        browseURL(o)
}
# knit these two vignettes using the docco style
rocco_view(system.file("doc", "docco-classic.Rmd", package = "knitr"))
rocco_view(system.file("doc", "knit_expand.Rmd", package = "knitr"))



