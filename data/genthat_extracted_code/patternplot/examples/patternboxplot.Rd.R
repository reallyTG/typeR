library(patternplot)


### Name: patternboxplot
### Title: Plot a boxplot using patterns and colors to fill the boxes.
### Aliases: patternboxplot

### ** Examples

library(patternplot)
library(jpeg)

Orange<-readJPEG(system.file("img", "oranges.jpg", package="patternplot"))
Strawberry <-readJPEG(system.file("img", "strawberries.jpg", package="patternplot"))
Watermelon<-readJPEG(system.file("img", "watermelons.jpg", package="patternplot"))

#Example 1
data <- read.csv(system.file("extdata", "fruits.csv", package="patternplot"))
x<-data$Fruit
y<-data$Weight
group<-data$Store
pattern.type<-list(Orange, Strawberry, Watermelon)
imageboxplot(data,x, y,group=NULL,pattern.type=pattern.type, 
             frame.color=c('orange', 'darkred', 'darkgreen'),ylab='Weight, Pounds')



