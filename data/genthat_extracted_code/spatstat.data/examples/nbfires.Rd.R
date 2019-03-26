library(spatstat.data)


### Name: nbfires
### Title: Point Patterns of New Brunswick Forest Fires
### Aliases: nbfires nbw.rect nbw.seg nbfires.extra
### Keywords: datasets spatial

### ** Examples

## Not run: 
##D   if(require(spatstat)) {
##D # Get the year 2000 data.
##D X <- split(nbfires,"year")
##D Y.00 <- X[["2000"]]
##D # Plot all of the year 2000 data, marked by fire type.
##D plot(Y.00,which.marks="fire.type")
##D # Cut back to forest and grass fires.
##D Y.00 <- Y.00[marks(Y.00)$fire.type %in% c("forest","grass")]
##D # Plot the year 2000 forest and grass fires marked by fire duration time.
##D stt  <- marks(Y.00)$dis.julian
##D fin  <- marks(Y.00)$out.julian
##D marks(Y.00) <- cbind(marks(Y.00),dur=fin-stt)
##D plot(Y.00,which.marks="dur")
##D # Look at just the rectangular subwindow (superimposed on the entire window).
##D nbw.mask <- as.mask(Window(nbfires), dimyx=500)
##D plot(nbw.mask, col=c("green", "white"))
##D plot(Window(nbfires), border="red", add=TRUE)
##D plot(Y.00[nbw.rect],use.marks=FALSE,add=TRUE)
##D plot(nbw.rect,add=TRUE,border="blue")
##D # Look at the K function for the year 2000 forest and grass fires.
##D K.00 <- Kest(Y.00)
##D plot(K.00)
##D    }
## End(Not run)



