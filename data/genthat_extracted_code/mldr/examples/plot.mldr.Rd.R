library(mldr)


### Name: plot.mldr
### Title: Generates graphic representations of an mldr object
### Aliases: plot.mldr

### ** Examples


library(mldr)
## Not run: 
##D # Label concurrence plot
##D plot(genbase, type = "LC") # Plots all labels
##D plot(genbase) # Same as above
##D plot(genbase, title = "genbase dataset", color.function = heat.colors) # Changes the title and color
##D plot(genbase, labelCount = 10) # Randomly selects 10 labels to plot
##D plot(genbase, labelIndices = genbase$labels$index[1:10]) # Plots info of first 10 labels
##D 
##D # Label bar plot
##D plot(emotions, type = "LB", col = terrain.colors(emotions$measures$num.labels))
##D 
##D # Label histogram plot
##D plot(emotions, type = "LH")
##D 
##D # Cardinality histogram plot
##D plot(emotions, type = "CH")
##D 
##D # Attributes by type
##D plot(emotions, type = "AT", cex = 0.85)
##D 
##D # Labelset histogram
##D plot(emotions, type = "LSH")
## End(Not run)



