library(dplR)


### Name: skel.plot
### Title: Skeleton Plot
### Aliases: skel.plot
### Keywords: hplot

### ** Examples
library(utils)
data(co021)
x <- co021[,33]
x.yrs <- time(co021)
x.name <- colnames(co021)[33]
## On a raw ring width series - undated
skel.plot(x)
## On a raw ring width series - dated with names
skel.plot(x, yr.vec = x.yrs, sname = x.name, master = TRUE)
## Not run: 
##D library(grDevices)
##D ## Try cross-dating
##D y <- co021[, 11]
##D y.yrs <- time(co021)
##D y.name <- colnames(co021)[11]
##D 
##D ## send to postscript - 3 pages total
##D fname1 <- tempfile(fileext=".ps")
##D print(fname1) # tempfile used for PS output
##D postscript(fname1)
##D ## "Master series" with correct calendar dates
##D skel.plot(x, yr.vec = x.yrs, sname = x.name, master = TRUE)
##D ## Undated series, try to align with last plot
##D skel.plot(y)
##D ## Here's the answer...
##D skel.plot(y, yr.vec = y.yrs, sname = y.name)
##D dev.off()
##D 
##D unlink(fname1) # remove the PS file
##D 
##D ## alternatively send to pdf
##D fname2 <- tempfile(fileext=".pdf")
##D print(fname2) # tempfile used for PDF output
##D pdf(fname2, width = 10, height = 7.5, paper = "USr")
##D skel.plot(x, yr.vec = x.yrs, sname = x.name, master = TRUE)
##D skel.plot(y)
##D skel.plot(y, yr.vec = y.yrs, sname = y.name)
##D dev.off()
##D 
##D unlink(fname2) # remove the PDF file
## End(Not run)



