library(gsDesign)


### Name: sfPoints
### Title: 4.5: Pointwise Spending Function
### Aliases: sfPoints
### Keywords: design

### ** Examples

# example to specify spending on a pointwise basis
x <- gsDesign(k=6, sfu=sfPoints, sfupar=c(.01, .05, .1, .25, .5, 1),
              test.type=2)
x

# get proportion of upper spending under null hypothesis
# at each analysis
y <- x$upper$prob[, 1] / .025

# change to cumulative proportion of spending
for(i in 2:length(y)) 
    y[i] <- y[i - 1] + y[i]

# this should correspond to input sfupar
round(y, 6)

# plot these cumulative spending points
plot(1:6/6, y, main="Pointwise spending function example", 
    xlab="Proportion of final sample size", 
    ylab="Cumulative proportion of spending", 
    type="p")

# approximate this with a t-distribution spending function
# by fitting 3 points
tx <- 0:100/100
lines(tx, sfTDist(1, tx, c(c(1, 3, 5)/6, .01, .1, .5))$spend)
text(x=.6, y=.9, labels="Pointwise Spending Approximated by")
text(x=.6, y=.83, "t-Distribution Spending with 3-point interpolation")

# example without lower spending at initial interim or 
# upper spending at last interim
x <- gsDesign(k=3, sfu=sfPoints, sfupar=c(.25, .25),
              sfl=sfPoints, sflpar=c(0,.25))
x




