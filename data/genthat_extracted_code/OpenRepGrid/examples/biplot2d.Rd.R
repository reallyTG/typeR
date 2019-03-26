library(OpenRepGrid)


### Name: biplot2d
### Title: Draw a two-dimensional biplot.
### Aliases: biplot2d

### ** Examples

## Not run: 
##D 
##D    biplot2d(boeker)                # biplot of boeker data
##D    biplot2d(boeker, c.lines=T)     # add construct lines
##D    biplot2d(boeker, center=2)      # with column centering
##D    biplot2d(boeker, center=4)      # midpoint centering
##D    biplot2d(boeker, normalize=1)   # normalization of constructs
##D 
##D    biplot2d(boeker, dim=2:3)       # plot 2nd and 3rd dimension
##D    biplot2d(boeker, dim=c(1,4))    # plot 1st and 4th dimension
##D 
##D    biplot2d(boeker, g=1, h=1)            # assign singular values to con. & elem.
##D    biplot2d(boeker, g=1, h=1, center=1)  # row centering (Slater)
##D    biplot2d(boeker, g=1, h=1, center=4)  # midpoint centering (ESA)
##D 
##D    biplot2d(boeker, e.color="red", c.color="blue")   # change colors
##D    biplot2d(boeker, c.color=c("white", "darkred"))   # mapped onto color range
##D    
##D    biplot2d(boeker, unity=T)                 # scale con. & elem. to equal length
##D    biplot2d(boeker, unity=T, scale.e=.5)     # scaling factor for element vectors
##D 
##D    biplot2d(boeker, e.labels.show=F)         # do not show element labels
##D    biplot2d(boeker, e.labels.show=c(1,2,4))  # show labels for elements 1, 2 and 4
##D    biplot2d(boeker, e.points.show=c(1,2,4))  # only show elements 1, 2 and 4
##D    biplot2d(boeker, c.labels.show=c(1:4))    # show constructs labels 1 to 4   
##D    biplot2d(boeker, c.labels.show=c(1:4))    # show constructs labels except 1 to 4
##D 
##D    biplot2d(boeker, e.cex.map=1)   # change size of texts for elements 
##D    biplot2d(boeker, c.cex.map=1)   # change size of texts for constructs 
##D 
##D    biplot2d(boeker, g=1, h=1, c.labels.inside=T)  # constructs inside the plot
##D    biplot2d(boeker, g=1, h=1, c.labels.inside=T,  # different margins and elem. color 
##D             mai=c(0,0,0,0), e.color="red") 
##D  
##D    biplot2d(boeker, strokes.x=.3, strokes.y=.05)  # change length of strokes
##D 
##D    biplot2d(boeker, flipaxes=c(T, F))      # flip x axis
##D    biplot2d(boeker, flipaxes=c(T, T))      # flip x and y axis
##D 
##D    biplot2d(boeker, outer.positioning=F)   # no positioning of con.-labels
##D 
##D    biplot2d(boeker, c.labels.devangle=20)  # only con. within 20 degree angle
## End(Not run) 




