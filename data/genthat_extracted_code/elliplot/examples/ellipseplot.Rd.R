library(elliplot)


### Name: ellipseplot
### Title: Draw Ellipse Summary Plot
### Aliases: ellipseplot ellipseplot.default ellipseplot.data.frame
###   ellipseplot.numeric ellipseplot.matrix ellipseplot.list
### Keywords: hplot

### ** Examples

# iris data: Sepal.Length v.s. Sepal.Width by Species
ellipseplot(iris[c(5,1)], iris[c(5,2)])

# PlantGrowth data: weight by group : single axis
# five number summaries are used.  
# similar to boxplot(weight~group,PlantGrowth)
ellipseplot(PlantGrowth[2:1], SUMMARY=fivenum)

# iris data: Sepal.Length v.s. Sepal.Width without factor
ellipseplot(iris[,1], iris[,2], xlab='Sepal.Length', ylab='Sepal.Width')

# list example
ellipseplot(list(untreated=rnorm(30,3,1), treated=rnorm(30,5,2)), 
            list(untreated=rnorm(20,6,3), treated=rnorm(20,4,2)))

# using cutomized sheer function
my.sheer.color <- function(col, level) adjustcolor(rainbow(100)[runif(1,1,100)], alpha.f=0.4)
ellipseplot(iris[c(5,1)], iris[c(5,2)], SHEER=my.sheer.color)




