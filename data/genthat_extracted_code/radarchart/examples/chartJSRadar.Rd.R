library(radarchart)


### Name: chartJSRadar
### Title: Make a ChartJS Radar Plot
### Aliases: chartJSRadar

### ** Examples

# Using the data frame interface
chartJSRadar(scores=skills)

# Or using a list interface
labs <- c("Communicator", "Data Wangler", "Programmer", "Technologist",  "Modeller", "Visualizer")

scores <- list("Rich" = c(9, 7, 4, 5, 3, 7),
 "Andy" = c(7, 6, 6, 2, 6, 9),
 "Aimee" = c(6, 5, 8, 4, 7, 6))

# Default settings
chartJSRadar(scores=scores, labs=labs)

# Fix the max score
chartJSRadar(scores=scores, labs=labs, maxScale=10)

# Fix max and spacing
chartJSRadar(scores=scores, labs=labs, maxScale=12, scaleStepWidth = 2)

# Change title and remove legend
chartJSRadar(scores=scores, labs=labs, main = "Data Science Radar", showLegend = FALSE)

# Add pass through settings for extra options
chartJSRadar(scores=scores, labs=labs, maxScale =10, scaleLineWidth=5)




