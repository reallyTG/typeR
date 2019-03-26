library(rMR)


### Name: tot.rss
### Title: Total Residual Sum of Squares for Broken Stick Model
### Aliases: tot.rss

### ** Examples

## load data ##
data(fishMR)

## subset data to appropriate region ##

data<-fishMR[fishMR$DO.mgL < 4,] 
data$times <- data$times-min(data$times)
data<-data[data$times< 6800,]

## calculate total RSS for different breakpoints ##

a1 <- tot.rss(data, break.pt = 4000,
xvar = "times", yvar = "DO.mgL") 
a2 <- tot.rss(data, break.pt = 4250,
xvar = "times", yvar = "DO.mgL")
a3 <- tot.rss(data, break.pt = 4500,
xvar = "times", yvar = "DO.mgL")
a4 <- tot.rss(data, break.pt = 4750,
xvar = "times", yvar = "DO.mgL") 
a5 <- tot.rss(data, break.pt = 5000,
xvar = "times", yvar = "DO.mgL")
a6 <- tot.rss(data, break.pt = 5250,
xvar = "times", yvar = "DO.mgL")

# a5 represents the break point for the 
# best broken stick linear model of the
# above 6 options.




