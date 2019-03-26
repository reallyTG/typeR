library(stationery)


### Name: rmd2pdf
### Title: Convert Rmd to PDF
### Aliases: rmd2pdf

### ** Examples

tdir <- tempdir()
fmt <- "rmd2pdf-guide"
dirout <- initWriteup(fmt, dir = file.path(tdir, fmt))
print(dirout)
list.files(dirout)
## No test: 
of1 <- try(rmd2pdf("skeleton.Rmd", wd = dirout))
if(inherits(of1, "try-error")){
    MESSG <- paste("Compiling the markdown file failed, perhaps",
                  "you should run with parameters verbose=TRUE",
                  "and keep_tex=TRUE")
    print(MESSG)
} else {
    ## Check the result file:
    MESSG <- paste("Check the directory", dirout, "for results.")
    print(MESSG)
    list.files(dirout)
    if(interactive() && file.exists(file.path(dirout, "skeleton.pdf"))) {
        browseURL(of1)
    }
}
## End(No test)
unlink(dirout)



