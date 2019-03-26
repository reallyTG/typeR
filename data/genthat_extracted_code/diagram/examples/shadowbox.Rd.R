library(diagram)


### Name: shadowbox
### Title: adds a box with a shadow to a plot
### Aliases: shadowbox
### Keywords: aplot

### ** Examples

openplotmat(main="shadowbox")

shadowbox(box.type = "rect", mid = c(0.1, 0.5),
          rady = 0.1, radx = 0.05, angle = 25)

shadowbox(box.type = "round", mid = c(0.3, 0.5),
          rady = 0.05, radx = 0.025, angle = 90,
          shadow.col = "darkred")

shadowbox(box.type = "ellipse", mid = c(0.5, 0.5),
          rady = 0.05, radx = 0.075, box.col = "blue")
          
shadowbox(box.type = "multi", mid = c(0.8, 0.5),
          rady = 0.05, radx = 0.05, box.col = "darkblue", nr = 5)



