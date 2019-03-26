library(microplot)


### Name: microplotAttrDisplay
### Title: Specify how to display the microplots for x.axis, y.axis, xlab,
###   ylab, and key.
### Aliases: microplotAttrDisplay
### Keywords: hplot

### ** Examples


## Not run: 
##D latexSetOptions()
##D 
##D filenames <-
##D   structure(c("tt010.pdf", "tt007.pdf", "tt004.pdf", "tt001.pdf",
##D               "tt011.pdf", "tt008.pdf", "tt005.pdf", "tt002.pdf",
##D               "tt012.pdf", "tt009.pdf", "tt006.pdf", "tt003.pdf"),
##D             .Dim = c(4L, 3L),
##D             .Dimnames = structure(list(
##D               rr = c("d", "c", "b", "a"),
##D               cc = c("E", "F", "G")),
##D               .Names = c("rr", "cc")),
##D             axis.names = structure(c("tt013.pdf", "tt014.pdf"), .Names = c("x", "y")),
##D             lab.names = structure(c("tt015.pdf", "tt016.pdf"), .Names = c("x", "y")),
##D             key.name = "tt017.pdf",
##D             class = c("microplotMatrix", "matrix"))
##D 
##D filenames
##D 
##D as.includegraphics(filenames, wd=".")
##D 
##D as.includegraphics(filenames, wd=".", as.attr=FALSE) ## default
##D 
##D as.includegraphics(filenames, wd=".", as.attr=TRUE)
##D 
##D as.includegraphics(filenames, wd=".", columnKey=1)
##D 
##D as.includegraphics(filenames, wd=".", columnKey=1:3)
##D 
##D as.includegraphics(filenames, wd=".", xlab=TRUE, ylab=TRUE)
##D 
##D as.includegraphics(filenames, wd=".",
##D                    label.x.axis="X tick values", label.y.axis="Y tick values")
##D 
##D tt <- data.frame(x=1:4, y=c(2,3,4,1), group=c("A","A","B","B"))
##D latex(lattice::xyplot(y ~ x | group, data=tt))
##D latex(lattice::xyplot(y ~ x | group, data=tt),
##D       label.x.axis="X Range", label.y.axis="Y Range")
##D 
##D demo("AEdotplot", package="microplot", ask=TRUE)
##D 
## End(Not run)



