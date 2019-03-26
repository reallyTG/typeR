library(ega)


### Name: plotParkesGrid
### Title: Plot a Parkes (Consensus) Error Grid
### Aliases: plotParkesGrid

### ** Examples

library(ggplot2)

# default
plotParkesGrid(glucose_data$ref, glucose_data$test)

# with options
plotParkesGrid(glucose_data$ref, glucose_data$test,
              pointsize=2,
              pointalpha=0.5,
              linesize=2,
              linealpha=0.3,
              linetype="dotdash")

# store return value and modify
peg <- plotParkesGrid(glucose_data$ref, glucose_data$test, type=2)

peg + theme_gray() +
   theme(plot.title = element_text(size = rel(2), colour = "red"))



