library(patternplot)


### Name: imagepie
### Title: Plot a pie chart with slices filled with png and jpeg images.
### Aliases: imagepie

### ** Examples

library(patternplot)
library(jpeg)
Tomatoes <-  readJPEG(system.file("img", "tomatoes.jpg", package="patternplot"))
Peas <- readJPEG(system.file("img", "peas.jpg", package="patternplot"))
Potatoes <-  readJPEG(system.file("img", "potatoes.jpg", package="patternplot"))

#Example 1
data <- read.csv(system.file("extdata", "vegetables.csv", package="patternplot"))
pattern.type<-list(Tomatoes,Peas,Potatoes)
imagepie(group=data$group,pct=data$pct,label=data$label,pattern.type=pattern.type,
         label.distance=1.25,frame.color='burlywood4', frame.size=0.8, label.size=6,
         label.color='forestgreen')





