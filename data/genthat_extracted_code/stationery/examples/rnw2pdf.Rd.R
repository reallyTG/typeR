library(stationery)


### Name: rnw2pdf
### Title: Convert (Sweave & compile) an Rnw or lyx file to PDF
### Aliases: rnw2pdf

### ** Examples

## No test: 
tdir <- tempdir()
fmt <- "rnw2pdf-guide-sweave"
dirout <- initWriteup(fmt, dir = file.path(tdir, fmt))
print(dirout)
list.files(dirout)
of1 <- try(rnw2pdf("skeleton.Rnw", engine = "Sweave", wd = dirout))
if(inherits(of1, "try-error")){
    MESSG <- paste("Compiling the markdown file failed, perhaps",
                   "there is an R or LaTeX error.", 
                   "Run again with parameters verbose=TRUE",
                   "and clean=FALSE")
    print(MESSG)
} else {
    ## Check the result file:
    MESSG <- paste("Check the directory", dirout, "for results.")
    print(MESSG)
    list.files(dirout)
    if(interactive() && file.exists(of1)) {
        browseURL(of1)
    }
}
unlink(dirout)
## End(No test)



