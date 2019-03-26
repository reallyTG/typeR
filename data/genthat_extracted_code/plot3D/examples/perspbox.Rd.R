library(plot3D)


### Name: Perspective box
### Title: Creates an empty perspective box, ready for adding objects
### Aliases: perspbox
### Keywords: hplot

### ** Examples

# save plotting parameters                            
 pm   <- par("mfrow")
 pmar <- par("mar")

## ========================================================================
## The 4 predefined box types
## ========================================================================

 par(mfrow = c(2, 2), mar = c(1, 1, 1, 1))
 
# box type with only backward panels
 perspbox(z = volcano, bty = "b", ticktype = "detailed", d = 2, 
          main  = "bty = 'b'")
# box as in 'persp'
 perspbox(z = volcano, bty = "f", ticktype = "detailed", 
          d = 2, main  = "bty = 'f'")

# back panels with gridlines, detailed axes
 perspbox(z = volcano, bty = "b2", ticktype = "detailed", 
          d = 2, main  = "bty = 'b2'")

# ggplot-type, simple axes 
 perspbox(z = volcano, bty = "g", 
          d = 2, main  = "bty = 'g'")

## ========================================================================
## A user-defined box
## ========================================================================

 par(mfrow = c(1, 1))

 perspbox(z = diag(2), bty = "u", ticktype = "detailed", 
          col.panel = "gold", col.axis = "white",  
          scale = FALSE, expand = 0.4, 
          col.grid = "grey", main = "user-defined")

# restore plotting parameters
 par(mfrow = pm)
 par(mar = pmar)



