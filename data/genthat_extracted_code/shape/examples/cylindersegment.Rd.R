library(shape)


### Name: cylindersegment
### Title: adds part of a cylinder to a plot
### Aliases: cylindersegment
### Keywords: aplot

### ** Examples

emptyplot(main = "cylindersegment")
cylindersegment(mid = c(0.1, 0.5), rx = 0.1, ry = 0.1, 
                from = pi, to = 3*pi/2, col = "blue",  
                len = 0.5, delt = 1.1, lwd = 2, angle = 90)
cylindersegment(mid = c(0.8, 0.5), rx = 0.1, ry = 0.1, 
                from = 0, to = pi/2, col = "red", len = 0.5, 
                delt = 1.0, lwd = 2, angle = 45)
cylindersegment(mid = c(0.5, 0.5), rx = 0.1, ry = 0.1, 
                from = pi/2, to = pi, col = "lightblue", 
                len = 0.2, delt = 1.5, lwd = 2)  
for (i in seq(0.1, 0.9, 0.1))
  cylindersegment(mid = c(i, 0.9), rx = 0.035, ry = 0.05, 
                  from = pi/2, to = 3*pi/2, col = "darkblue", 
                  len = 0.1, angle = 90)



