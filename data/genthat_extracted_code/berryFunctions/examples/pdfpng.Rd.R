library(berryFunctions)


### Name: pdfpng
### Title: Create pdf and png graph
### Aliases: pdfpng
### Keywords: file

### ** Examples


## Not run: 
##D  # excluded from CRAN checks, file opening not wanted
##D pdfpng(   plot(rnorm(500), type="l")   , file="dummyplot", png=FALSE)
## End(Not run)

pdfpng({par(bg=8, las=1); plot(cumsum(rnorm(500)), type="l")},
       file="dummyplot", res=100, open=FALSE)
pdfpng({par(bg=8, las=1); plot(cumsum(rnorm(500)), type="l")},
       file="dummyplot", overwrite=c(TRUE,FALSE), open=FALSE)

# Nesting of functions is possible:
a <- list( cumsum(rnorm(2000)), cumsum(rnorm(20)) )
pdfpng(plot(a[[1]]), file="dummyplot", overwrite=TRUE, open=FALSE)
bfun <- function(b) pdfpng(plot(b,type="l"), file="dummyplot", 
                           overwrite=TRUE, open=FALSE)
cfun <- function(c) bfun(c)
bfun(a[[1]])
sapply(a, function(d) cfun(d))


pdfpng(plot(-10:100, log="y"), "dummyplot",overwr=TRUE,png=FALSE, open=FALSE)
pdfpng({plot(1); plot(dummyobject)}, "dummyplot", overwrite=TRUE, 
       png=FALSE, open=FALSE)


unlink("dummyplot.pdf") ; unlink("dummyplot.png") ; unlink("dummyplot_1.png")




