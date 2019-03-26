library(plotrix)


### Name: jiggle
### Title: Calculate equally spaced values within a range.
### Aliases: jiggle
### Keywords: misc

### ** Examples

 ahw.df<-data.frame(Age=rnorm(100,35,10),
  Height=rnorm(100,160,15),Weight=rnorm(100,75,20))
 par(mfrow=c(1,3))
 boxplot(ahw.df$Age,main="Age")
 points(jiggle(100,c(0.5,1.5)),ahw.df$Age,col="red")
 boxplot(ahw.df$Height,main="Height")
 points(jiggle(100,c(0.5,1.5)),ahw.df$Height,col="green")
 boxplot(ahw.df$Weight,main="Weight")
 points(jiggle(100,c(0.5,1.5)),ahw.df$Weight,col="blue")



