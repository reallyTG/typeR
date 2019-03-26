library(rattle)


### Name: genPlotTitleCmd
### Title: Generate a string to add a title to a plot
### Aliases: genPlotTitleCmd
### Keywords: aplot

### ** Examples

# generate some random plot
plot(rnorm(100))

# generate the string representing the command to add titles
tl <- genPlotTitleCmd("Sample Plot of", "No Particular Importance")

# cause the string to be executed as an R command
eval(parse(text=tl))



