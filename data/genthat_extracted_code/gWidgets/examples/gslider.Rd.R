library(gWidgets)


### Name: gslider
### Title: Constructors for widgets to select a value from a sequence.
### Aliases: gslider gspinbutton
### Keywords: interface

### ** Examples

## Not run: 
##D   x <- rnorm(100)
##D 
##D   ## our handler
##D   plotHist <- function(...)
##D     hist(x, col=gray(svalue(sb)), breaks = svalue(sl))
##D 
##D    
##D 
##D   w <- gwindow("Slider and spinbox example")
##D   tbl = glayout(container=w)
##D   tbl[1,1] <- "Slide value to adjust shade"
##D   tbl[1,2] <- (sb <- gspinbutton(from=0,to=1,by=0.05,value=.5, container=tbl,
##D     handler=plotHist))
##D   tbl[2,1] <- "No. breaks"
##D   tbl[2,2, expand=TRUE] <- (sl <- gslider(from = 1, to= 100, by=1, value = 10,
##D     container = tbl, handler = plotHist))
##D 
##D ## update slider using [<-
##D   sl[] <- seq(2,50, by=2)
##D 
##D 
##D   ## other sequence:
##D   w <- gwindow("Slider with sequence")
##D   sl <- gslider(letters, container=w)
##D   svalue(sl, index=TRUE)
##D   svalue(sl) <- "m"
##D   sl[] <- LETTERS ## can be sorted via sort(unique(LETTERS))
## End(Not run)



