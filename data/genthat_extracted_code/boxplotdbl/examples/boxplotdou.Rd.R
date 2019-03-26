library(boxplotdbl)


### Name: boxplotdou
### Title: Double Box Plot
### Aliases: boxplotdou boxplotdou.default boxplotdou.data.frame
###   boxplotdou.factor boxplotdou.formula boxplotdou.list
### Keywords: hplot

### ** Examples

# iris data: Sepal.Length v.s. Sepal.Width by Species
stat <- boxplotdou(iris[c(5,1)], iris[c(5,2)])
boxplotdou(iris[,5], iris[,1], iris[,5], iris[,2])
boxplotdou(Sepal.Length~Species, iris, Sepal.Width~Species, iris)
boxplotdou(stat, main='redraw by saved stat')

# color and shading
boxplotdou(iris[c(5,1)], iris[c(5,2)], col=c('wheat','wheat','black'),
           boxcol='springgreen')
boxplotdou(iris[c(5,1)], iris[c(5,2)], shading=c(3,5))
boxplotdou(iris[c(5,1)], iris[c(5,2)], shading=5, shading.angle=c(0,90))
boxplotdou(iris[c(5,1)], iris[c(5,2)], blackwhite=TRUE)

# customized sheer funtion
mysheer <- function(x) 
             adjustcolor(x, alpha.f=0.2, red.f=0.3, green.f=0.3, blue.f=0.3)
boxplotdou(iris[c(5,1)], iris[c(5,2)], COLOR.SHEER=mysheer)

# whisker
boxplotdou(iris[c(5,1)], iris[c(5,2)], boxed.whiskers=TRUE)
boxplotdou(iris[c(5,1)], iris[c(5,2)], outliers.has.whiskers=TRUE)

# condense
boxplotdou(iris[c(5,1)], iris[c(5,2)], condense=TRUE)

# labels
boxplotdou(iris[c(5,1)], iris[c(5,2)], factor.labels=FALSE)
boxplotdou(iris[c(5,1)], iris[c(5,2)], factor.labels=TRUE)
boxplotdou(iris[c(5,1)], iris[c(5,2)], factor.labels=TRUE, 
                                       draw.legend=FALSE)
boxplotdou(iris[c(5,1)], iris[c(5,2)], factor.labels=c('Se','Ve','Vi'))
boxplotdou(iris[c(5,1)], iris[c(5,2)], factor.labels='+', 
                                       name.on.axis=FALSE)

# customized summary function
mystat <- function(x) boxplot(formula=x, range=1, plot=FALSE)
boxplotdou(iris[c(5,1)], iris[c(5,2)], STAT=mystat)

# graphic parameters
boxplotdou(iris[c(5,1)], iris[c(5,2)], xlim=c(4.8, 7.0), ylim=c(2.0, 3.5))

# print summary
boxplotdou(iris[c(5,1)], iris[c(5,2)], plot=FALSE)



