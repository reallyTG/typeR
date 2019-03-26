library(PASWR2)


### Name: GD
### Title: Times Until Failure
### Aliases: GD
### Keywords: datasets

### ** Examples

ggplot(data = GD, aes(x = attf, y = ..density..)) + 
geom_histogram(binwidth = 2, fill = "cornsilk", color = "orange") + 
geom_density(color = "gray", size = 1) + labs( x = "time until failure in hours")



