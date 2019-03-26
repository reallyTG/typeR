library(patternplot)


### Name: imagebar
### Title: Plot a bar chart with bars filled with png and jpeg images.
### Aliases: imagebar

### ** Examples

library(patternplot)
library(jpeg)

#http://all-free-download.com/free-vector/modern-seamless-pattern.html
childcare<-readJPEG(system.file("img", "childcare.jpg", package="patternplot"))
food<-readJPEG(system.file("img", "food.jpg", package="patternplot"))
housing <-readJPEG(system.file("img", "housing.jpg", package="patternplot"))

#Example 1
data <- read.csv(system.file("extdata", "monthlyexp.csv", package="patternplot"))
data<-data[which(data$Location=='City 1'),]
x<-factor(data$Type, c('Housing', 'Food',  'Childcare'))
y<-data$Amount
pattern.type<-list(housing, food, childcare)
imagebar(data,x, y,group=NULL,pattern.type=pattern.type,
         frame.color=c('darkred', 'darkgreen', 'orange'),
         ylab='Monthly Expenses, Dollars')




