library(microplot)


### Name: as.htmlimg
### Title: Place a filename or filepath in the format used by HTML
### Aliases: as.htmlimg
### Keywords: documentation utilities

### ** Examples

as.htmlimg("abcd.png")
as.htmlimg("abcd.png", wd=".")
as.htmlimg(c("abcd.png", "efgh.png"))
cat( as.htmlimg("abcd.png")                , "\n")
cat( as.htmlimg("abcd.png", wd=".")        , "\n")
cat( paste(as.htmlimg(c("abcd.png", "efgh.png")), "\n"))

## For an example in context, please see the package example:
##    system.file(package="microplot", "examples/irisRMarkdownHtml.Rmd")
## Copy file irisRMarkdownHtml.Rmd to a directory in which you have write privileges.
## Run the statement
##   rmarkdown::render("irisRMarkdownHtml.Rmd", output_file="irisRMarkdownHtml.html")
## at the R Console.



