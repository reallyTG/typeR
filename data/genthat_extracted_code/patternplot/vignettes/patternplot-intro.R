## ----setup, include=FALSE------------------------------------------------
library(knitr)
library(Cairo)
opts_chunk$set(out.extra='style="display:block; margin: auto"', fig.align="center", dev='CairoPNG')

## ----e1------------------------------------------------------------------
library(patternplot)
library(ggplot2)
data <- read.csv(system.file("extdata", "vegetables.csv", package="patternplot"))
#Example 1
pattern.type<-c('hdashes', 'vdashes', 'bricks')
pie1<-patternpie(group=data$group,pct=data$pct,label=data$label, 
                 pattern.type=pattern.type, pixel=0.3, pattern.line.size=0.2, 
                 frame.size=1.5, label.size=5, label.distance=1.35)
pie1+ggtitle('(A) Black and White with Patterns')
#Example 2
pattern.color<-c('red3','green3', 'white' )
background.color<-c('dodgerblue', 'lightpink', 'orange')
pie2<-patternpie(group=data$group,pct=data$pct,label=data$label, 
                 pattern.type=pattern.type,pattern.color=pattern.color,
                 background.color=background.color, frame.color='grey40',
                 pixel=0.3, pattern.line.size=0.3, frame.size=1.5, 
                 label.size=5, label.distance=1.35)
pie2+ggtitle('(B) Colors with Patterns')


## ----e2------------------------------------------------------------------
library(patternplot)
library(ggplot2)
library(jpeg)
Tomatoes <-  readJPEG(system.file("img", "tomatoes.jpg", package="patternplot"))
Peas <- readJPEG(system.file("img", "peas.jpg", package="patternplot"))
Potatoes <-  readJPEG(system.file("img", "potatoes.jpg", package="patternplot"))

#Example 1
data <- read.csv(system.file("extdata", "vegetables.csv", package="patternplot"))
pattern.type<-list(Tomatoes,Peas,Potatoes)
imagepie(group=data$group,pct=data$pct,label=data$label,
               pattern.type=pattern.type,frame.color='burlywood4', frame.size=0.8, 
               label.color='forestgreen', label.size=5, label.distance=1.3)

## ----e3, fig.width=6, fig.height=6---------------------------------------
data <- read.csv(system.file("extdata", "monthlyexp.csv", package="patternplot"))
data<-data[which(data$Location=='City 1'),]
#Example 1
x<-factor(data$Type, c('Housing', 'Food',  'Childcare'))
y<-data$Amount
pattern.type<-c('hdashes', 'blank', 'crosshatch')
pattern.color=c('black','black', 'black')
background.color=c('white','white', 'white')
density<-c(20, 20, 10)
barp1<-patternbar(data,x, y,group=NULL,ylab='Monthly Expenses, Dollar', 
                  pattern.type=pattern.type,pattern.color=pattern.color, 
                  background.color=background.color, pattern.line.size=0.5,
                  frame.color=c('black', 'black', 'black'), density=density)
barp1+ggtitle('(A) Black and White with Patterns')
#Example 2
pattern.color=c('black','white', 'grey20')
background.color=c('lightgreen','lightgreen', 'lightgreen')
barp2<-patternbar(data,x, y,group=NULL,ylab='Monthly Expenses, Dollar', 
                  pattern.type=pattern.type,pattern.color=pattern.color, 
                  background.color=background.color, pattern.line.size=0.5,
                  frame.color=c('black', 'black', 'black'), density=density)
barp2+ggtitle('(B) Colors with Patterns')

## ----e4, fig.width=6, fig.height=6---------------------------------------
library(jpeg)
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
                ylab='Monthly Expenses, Dollar')

## ----e5------------------------------------------------------------------
library(patternplot)
library(png)
#Example 1
data <- read.csv(system.file("extdata", "fruits.csv", package="patternplot"))
x<-data$Store
y<-data$Weight
group<-data$Fruit
pattern.type=c('nwlines', 'blank', 'waves')
background.color=c('white','gray80', 'white')
pattern.color=c('black','black', 'black')
density<-c(2, 1, 3)
boxp1<-patternboxplot(data,x, y,group=group,pattern.type=pattern.type, 
                      pattern.color=pattern.color, background.color=background.color, 
                      density=density, pixel=1.2, xlab='', ylab='Weights, pounds', 
                      legend.h=1.5, legend.y.pos=0.5, legend.ratio1=0.005, 
                      legend.x.pos=0.15)
boxp1+ggtitle('(A) Black and White with Patterns')
#Example 2
background.color=c('gold','lightpink', 'lightgreen')
pattern.color=c('black','white', 'grey20')
boxp2<-patternboxplot(data,x, y,group=group,pattern.type=pattern.type, 
                      pattern.color=pattern.color, background.color=background.color, 
                      density=density, pixel=1.2, xlab='', ylab='Weights, pounds', 
                      legend.h=1.5, legend.y.pos=0.5, legend.ratio1=0.005, 
                      legend.x.pos=0.15)
boxp2+ggtitle('(B) Colors with Patterns')

## ----e6------------------------------------------------------------------
library(patternplot)
library(jpeg)
Orange<-readJPEG(system.file("img", "oranges.jpg", package="patternplot"))
Strawberry <-readJPEG(system.file("img", "strawberries.jpg", package="patternplot"))
Watermelon<-readJPEG(system.file("img", "watermelons.jpg", package="patternplot"))

#Example 1
data <- read.csv(system.file("extdata", "fruits.csv", package="patternplot"))
x<-data$Store
y<-data$Weight
group<-data$Fruit
pattern.type<-list(Orange, Strawberry, Watermelon)
imageboxplot(data,x, y,group=group, pattern.type=pattern.type, 
                    frame.color=c('orange', 'darkred', 'darkgreen'), 
                    linetype=c('solid', 'dashed', 'dotted'),frame.size=0.8, 
                    xlab='', ylab='Weights, pounds', legend.h=1.5, legend.y.pos=0.5, 
                    legend.ratio1=0.005, legend.x.pos=0.15)

