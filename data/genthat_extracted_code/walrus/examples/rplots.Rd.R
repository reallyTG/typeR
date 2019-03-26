library(walrus)


### Name: rplots
### Title: Box & Violin Plots
### Aliases: rplots

### ** Examples

data('eurosoccer', package='WRS2')

# violin plots

walrus::rplots(
    data = eurosoccer,
    vars = "GoalsGame",
    splitBy = "League")


# box plots

walrus::rplots(
    data = eurosoccer,
    vars = "GoalsGame",
    splitBy = "League",
    violin = FALSE,
    boxplot = TRUE,
    dot = FALSE)




