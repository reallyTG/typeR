library(wmtsa)


### Name: create.signalSeries
### Title: Converts various time series to an object of class
### Aliases: create.signalSeries
### Keywords: ts

### ** Examples

## convert an explicitly developed numeric vector 
x <- 1:10
create.signalSeries(x)

## now impose hypothetical positions on the data 
create.signalSeries(x, pos=list(from=0.3, by=0.1))

## extract the values from position 0.5 onward 
create.signalSeries(x, pos=list(from=0.3, by=0.1), from=0.5)

## extract the values from position 0.5 onward, 
## but keep only the first 3 values of the 
## extraction 
create.signalSeries(x, pos=list(from=0.3, by=0.1), from=0.5, length=3)

## extract the values from position 0.5 onward and 
## skip every other point (sample the data at 
## 0.2 position intervals) 
create.signalSeries(x, pos=list(from=0.3, by=0.1), from=0.5, by=0.2)

## simply return the first 4 values, and supply a 
## title and some documentation comments to the 
## data 
create.signalSeries(x, length=4, title="Faux Data", doc="An example")



