library(googleVis)


### Name: gvisBubbleChart
### Title: Google Bubble Chart with R
### Aliases: gvisBubbleChart
### Keywords: iplot

### ** Examples



bubble1 <- gvisBubbleChart(Fruits, idvar="Fruit", xvar="Sales", yvar="Expenses")
plot(bubble1)

## Set color and size
bubble2 <- gvisBubbleChart(Fruits, idvar="Fruit", xvar="Sales", yvar="Expenses",
                          colorvar="Location", sizevar="Profit",
                          options=list(hAxis='{minValue:75, maxValue:125}'))

plot(bubble2)

## Use year to color the bubbles
bubble3 <- gvisBubbleChart(Fruits, idvar="Fruit", xvar="Sales", yvar="Expenses",
                           colorvar="Year", sizevar="Profit",
                           options=list(hAxis='{minValue:75, maxValue:125}'))
plot(bubble3)

## Gradient colour example
bubble4 <- gvisBubbleChart(Fruits, idvar="Fruit", xvar="Sales", yvar="Expenses",
                          sizevar="Profit",
                          options=list(hAxis='{minValue:75,  maxValue:125}', 
                                  colorAxis="{colors: ['lightblue', 'blue']}"))
plot(bubble4)

## Not run: 
##D ## Moving bubble chart over time, aka motion chart
##D 
##D M <- gvisMotionChart(Fruits, Fruit, Year)
##D plot(M)
## End(Not run)







