library(patternplot)


### Name: patternpie
### Title: Plot a pie chart using patterns and colors to fill the slices.
### Aliases: patternpie

### ** Examples

#Example 1
library(patternplot)
data <- read.csv(system.file("extdata", "vegetables.csv", package="patternplot"))
pattern.type<-c('hdashes', 'vdashes', 'bricks')
patternpie(group=data$group,pct=data$pct,label=data$label, pattern.type=pattern.type, 
           pixel=0.3, pattern.line.size=0.2, frame.size=1.5)

#Example 2
pattern.color<-c('red3','green3', 'white' )
background.color<-c('dodgerblue', 'lightpink', 'orange')
patternpie(group=data$group,pct=data$pct,label=data$label, pattern.type=pattern.type,
           pattern.color=pattern.color,background.color=background.color, 
           frame.color='grey40', pixel=0.3, pattern.line.size=0.3, frame.size=1.5)



