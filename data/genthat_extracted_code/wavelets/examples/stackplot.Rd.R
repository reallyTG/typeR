library(wavelets)


### Name: stackplot
### Title: Stacked Plotting
### Aliases: stackplot
### Keywords: ts

### ** Examples

A <- array(c(1,2,3,4), c(3,4))

# Plotting the vectors c(1,2,3), c(4,1,2), c(3,4,1), and c(2,3,4) in a
# stacked plot with 4 separate plots).  The x-values will be 1:3.
stackplot(A)

#Plotting A with numeric labels on the axis and making the plot "red".
#Also labeling the x-axis with "X-Label", and the y-axis with "Y-Label".
stackplot(A, axes.labels = TRUE, xlab = "X-Label", ylab = "Y-Label")

timeSeries <- ts(A)
# Plotting the Time Series created by coercing the array A into a Time
# Series.  Observe that this plot similar to the plot in the first example.
stackplot(timeSeries)

lfig <- 2:11
hfig <- 1:10
# Plotting a stacked plot of two types: histogram and lines.  Where the
# line joins the points (1,2) and (10,11), and the histogram is similar to
# the histogram formed by entering plot(1:10, type = "h").  The line will
# be red and the histogram will be yellow.
stackplot(list(lfig, hfig), type = c("l", "h"), col = c("red", "yellow"))




