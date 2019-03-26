library(personograph)


### Name: personograph
### Title: Plots a personograph
### Aliases: personograph

### ** Examples

data <- list(first=0.9, second=0.1)
personograph(data)
# With colors
personograph(data, colors=list(first="red", second="blue"))
# With different icon.style
personograph(data, icon.style=4) # numeric from 1-11
# Plot a thousand in a 20x50 grid
personograph(data, n.icons=1000, dimensions=c(20,50), plot.width=0.75)



