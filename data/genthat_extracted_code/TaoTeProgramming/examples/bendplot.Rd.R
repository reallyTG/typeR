library(TaoTeProgramming)


### Name: bendplot
### Title: Bend plots
### Aliases: bendplot bendplotmultcol bend
### Keywords: hplot

### ** Examples

# one color
bendplot(xdelta=150, ydelta=150, 
    color=grep("green", colors(), value=TRUE), seed=2)
    
# multiple colors    
bendplotmultcol(xdelta=150, ydelta=150, 
    color=grep("green", colors(), value=TRUE), seed=2) 
    
bendplotmultcol(xdelta=100, ydelta=200, sd=.001, 
   color=grep("sienna", colors(), value=TRUE))



