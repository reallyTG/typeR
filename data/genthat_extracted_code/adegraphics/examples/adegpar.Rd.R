library(adegraphics)


### Name: adegpar
### Title: Handling ADEg graphical parameters
### Aliases: adegpar
### Keywords: list color

### ** Examples

oldparamadeg <- adegpar()
    
X <- data.frame(x = runif(50, -1, 2), y = runif(50, -1, 2))
s.label(X)
names(adegpar())
adegpar("paxes.draw", "psub.cex")
adegpar()$pback$col
adegpar("paxes.draw" = TRUE, "psu.ce" = 3, "pback.col" = "grey85")
s.label(X)

adegpar(oldparamadeg)



