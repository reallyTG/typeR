library(stationery)


### Name: rmd2html
### Title: Convert an Rmd file into an HTML file
### Aliases: rmd2html

### ** Examples

## No test: 
tdir <- tempdir()
doctype <- "rmd2html-guide"
dirout <- initWriteup(doctype, dir = file.path(tdir, doctype))
list.files(dirout)

result <- try(rmd2html("skeleton.Rmd", wd = dirout))
if(inherits(result, "try-error")){
    MESSG <- paste("Compiling the markdown file failed, perhaps",
                  "your version of pandoc is not found")
    print(MESSG)
} else {
    ## Check the result file:
    MESSG <- paste("Check the directory", dirout, "for results.")
    print(MESSG)
    list.files(dirout)
    if(interactive() && file.exists(file.path(dirout, "skeleton.html"))) {
        browseURL(file.path(dirout, "skeleton.html"))
    }
}
unlink(dirout)
## End(No test)



