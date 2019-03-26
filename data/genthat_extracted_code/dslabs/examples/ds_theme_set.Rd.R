library(dslabs)


### Name: ds_theme_set
### Title: dslabs theme set
### Aliases: ds_theme_set

### ** Examples

library(ggplot2)
ds_theme_set()
qplot(hp, mpg, data=mtcars, color=am, facets=gear~cyl, 
main="Scatterplots of MPG vs. Horsepower", 
xlab="Horsepower", ylab="Miles per Gallon")




