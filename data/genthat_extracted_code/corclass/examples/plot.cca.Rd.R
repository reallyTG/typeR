library(corclass)


### Name: plot.cca
### Title: Plotting function for CCA modules.
### Aliases: plot.cca

### ** Examples

    data(cca.example)
    res1 <- cca(cca.example) # with igraph 0.7, this should find 3 classes of sizes 218 391 144.
    plot(res1, 1) # plot the first module
    plot(res1, 2) # plot the second module
    plot(res1, 3) # plot the third module
    
    plot(res1, 1, bw = TRUE) # check out first module in black and white
    plot(res1, 1, LAYOUT = layout.fruchterman.reingold) # try a different layout algorithm
    
    # example of saving a fixed layout
    layout1 <- plot(res1, 1) # try out a layout ...
    layout1 <- plot(res1, 1) # ... try again
    layout1 <- plot(res1, 1) # ... until one looks good
    plot(res1, 1, LAYOUT = layout1, file = "module1.pdf") # now save it to a file



