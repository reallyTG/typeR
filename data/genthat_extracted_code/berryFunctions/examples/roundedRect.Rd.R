library(berryFunctions)


### Name: roundedRect
### Title: Rectangles with rounded corners
### Aliases: roundedRect
### Keywords: aplot

### ** Examples

plot(1:10)  ;  rect(4,2,7,8, border=8)
roundedRect(4,2,7,8, rounding=0.1)
roundedRect(4,2,7,8, rounding=0.25) # default
roundedRect(4,2,7,8, rounding=0.5)
roundedRect(4,2,7,8, rounding=-0.1, border="red")
roundedRect(4,2,7,8, rounding=1.1, border="blue")
roundedRect(2,2,8,4, rounding=0.5) # in long boxes, 0.5 is max
roundedRect(2,2,8,4, rounding=0.5, bothsame=FALSE, corfactor=1, border=3)


plot(1:10)  ;  rect(4,2,7,8, border=8)
roundedRect(4,2,7,8, corners=c(2,4))

plot(1:10, asp=1)  ;  rect(4,2,7,8, border=8)
roundedRect(4,2,7,8)
roundedRect(4,2,7,8, aspcorrect=FALSE, border="red") # results depend on asp

plot(1:10, asp=1.5)  ;  rect(4,2,7,8, border=8)
roundedRect(4,2,7,8)
roundedRect(4,2,7,8, aspcorrect=FALSE, border="red") # results depend on asp

plot(1:10, asp=1)  ;  rect(4,2,7,8, border=8)
roundedRect(4,2,7,8) # difference only visible if rect is clearly not a square:
roundedRect(4,2,7,8, bothsame=FALSE, border="red")
roundedRect(4,2,7,8, bothsame=FALSE, aspcorrect=TRUE, border="blue")

## Not run: 
##D  # aspect correction factor determination
##D rrtest <- function(...) roundedRect(10,0.5, 35,15, border=2, factorpoints=TRUE)
##D pdfpng({plot(1:40                     ); rrtest();
##D         plot(1:40, ylim=c(0,15)       ); rrtest();
##D         plot(1:40, ylim=c(0,15), asp=1); rrtest();
##D         roundedRect(2,0, 8,15, factorpoints=TRUE);
##D         roundedRect(15,10, 25,16, npoints=200)}, 
##D        file="dummytest", png=F, overwrite=T)
## End(Not run)




