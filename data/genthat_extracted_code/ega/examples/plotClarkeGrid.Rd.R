library(ega)


### Name: plotClarkeGrid
### Title: Plot a Clarke Error Grid
### Aliases: plotClarkeGrid

### ** Examples

library(ggplot2)

# default
plotClarkeGrid(glucose_data$ref, glucose_data$test)

# with options
plotClarkeGrid(glucose_data$ref, glucose_data$test,
              pointsize=1.5,
              pointalpha=0.6,
              linetype="dashed")

# store return value and modify
ceg <- plotClarkeGrid(glucose_data$ref, glucose_data$test)

ceg + theme_gray() +
   theme(plot.title = element_text(size = rel(2), colour = "blue"))



