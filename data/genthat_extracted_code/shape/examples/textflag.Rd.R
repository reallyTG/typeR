library(shape)


### Name: textflag
### Title: adds a filled rounded rectangular box with a text to a plot
### Aliases: textflag
### Keywords: aplot

### ** Examples

emptyplot()
textflag(mid = c(0.5, 0.5), radx = 0.5, rady = 0.1, 
         lcol = "white",  lab = "hello", cex = 5, font = 2:3)
 
textflag(mid = c(0.5, 0.15), radx = 0.5, rady = 0.1, 
         rx = 0.3,lcol = "black", lab = "hello 2", cex = 4, 
         font = 2, angle = 20, tcol = "darkblue")
  
textflag(mid = c(0.5, 0.85), radx = 0.5, rady = 0.1, rx = 0.03,
         lcol = "white", lab = "hello 3", cex = 4, font = 2, 
         leftright = FALSE)



