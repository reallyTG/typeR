library(R2HTML)


### Name: HTMLgrid
### Title: Creates a HTML grid using ActiveWidget grid -
###   www.activewidgets.com
### Aliases: HTMLgrid HTMLgrid_inline HTMLgrid_references HTMLgrid_summary
### Keywords: datasets IO

### ** Examples

    data(iris)
    fic <- HTMLInitFile(useGrid=TRUE,useLaTeX=FALSE)
    fic <- HTMLgrid_inline(iris,file=fic)
    cat("\n Browse file 'fic':",fic)
    ## Not run: browseURL(fic)



