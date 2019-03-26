library(rtrim)


### Name: heatmap
### Title: Plot a heatmap representation of observed and/or imputed counts.
### Aliases: heatmap

### ** Examples

data(skylark2)
z <- trim(count ~ site + year, data=skylark2, model=3)
heatmap(z,"imputed")




