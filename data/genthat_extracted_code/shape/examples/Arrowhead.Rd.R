library(shape)


### Name: Arrowhead
### Title: adds arrowheads to a plot
### Aliases: Arrowhead
### Keywords: aplot

### ** Examples

emptyplot(main = "Arrowhead")
Arrowhead(x0 = runif(10), y0 = runif(10), angle = runif(10)*360, 
          arr.length = 0.3, arr.type = "circle", arr.col = "green")
Arrowhead(x0 = runif(10), y0 = runif(10), angle = runif(10)*360, 
          arr.length = 0.4, arr.type = "curved", arr.col = "red")
Arrowhead(x0 = runif(10), y0 = runif(10), angle = runif(10)*360, 
          arr.length = runif(10), arr.type = "triangle", 
          arr.col = rainbow(10))



