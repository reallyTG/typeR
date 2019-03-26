library(binst)


### Name: create_earthbreaks
### Title: Create breaks using earth (i.e. MARS)
### Aliases: create_earthbreaks

### ** Examples

earth_breaks <- create_breaks(x=iris$Sepal.Length, y=iris$Sepal.Width, method="earth")
create_bins(iris$Sepal.Length, earth_breaks)



