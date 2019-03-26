library(sidier)


### Name: spatial.plot
### Title: spatial plot of populations
### Aliases: spatial.plot

### ** Examples


library(ggplot2)
data(ex_Coords)
data(ex_alignment1) # this will read a fasta file with the name 'alignExample'

# A simple plot of the population network using geographic coordinates:
spatial.plot (align=alignExample,X=ex_Coords[,2],Y=ex_Coords[,3])

# Changing vertex names and location:
spatial.plot (align=alignExample,X=ex_Coords[,2],Y=ex_Coords[,3],
cex.vertex=2,label=c(1:8),label.pos="c",modules=TRUE)

# Plotting network on a map:
# Uncomment the lines below. It would take more than 5 seconds to run
# spatial.plot (align=alignExample,X=ex_Coords[,2],Y=ex_Coords[,3],
# cex.vertex=2,label=c(1:8),modules=TRUE, plot.ggmap=TRUE)

# Displaying only population coordinates (sampling desing).
# Uncomment the lines below. It would take more than 5 seconds to run
# spatial.plot (align=alignExample,X=ex_Coords[,2],Y=ex_Coords[,3],
# cex.vertex=2,label=c(1:8), plot.ggmap=TRUE,plot.edges=FALSE,
# bgcol=c("red","orange","green4","green1","yellow","brown","blue","purple"))






