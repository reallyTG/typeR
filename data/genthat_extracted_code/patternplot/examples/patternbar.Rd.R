library(patternplot)


### Name: patternbar
### Title: Plot a bar chart using patterns and colors to fill the bars.
### Aliases: patternbar

### ** Examples

#Example 1
data <- read.csv(system.file("extdata", "monthlyexp.csv", package="patternplot"))
data<-data[which(data$Location=='City 1'),]
x<-factor(data$Type, c('Housing', 'Food',  'Childcare'))
y<-data$Amount
pattern.type<-c('hdashes', 'blank', 'crosshatch')
pattern.color=c('black','black', 'black')
background.color=c('white','white', 'white')
density<-c(20, 20, 10)
patternbar(data,x, y,group=NULL,ylab='Monthly Expenses, Dollars', pattern.type=pattern.type,
           pattern.color=pattern.color, background.color=background.color,
           pattern.line.size=0.5,frame.color=c('black', 'black', 'black'), density=density)

#Example 2
pattern.color=c('black','white', 'grey20')
background.color=c('lightgreen','lightgreen', 'lightgreen')
patternbar(data,x, y,group=NULL,ylab='Monthly Expenses, Dollars', pattern.type=pattern.type,
           pattern.color=pattern.color, background.color=background.color,
           pattern.line.size=0.5,frame.color=c('black', 'black', 'black'), density=density)




