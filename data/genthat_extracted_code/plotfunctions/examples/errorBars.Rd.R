library(plotfunctions)


### Name: errorBars
### Title: Add error bars to a plot.
### Aliases: errorBars

### ** Examples


# example InsectSprays from R datasets

InsectSprays$type <- ifelse( InsectSprays$spray %in% c("A", "B", "F"), 1,2)
avg <- with(InsectSprays, tapply(count, list(spray), mean))
sds <- with(InsectSprays, tapply(count, list(spray), sd))


# barplot:
b <- barplot(avg, besides=TRUE, main="Insect Sprays", ylim=c(0,20))
errorBars(b, avg, sds, xpd=TRUE, length=.05)

# constrain error bars to max and min of plot:
b <- barplot(avg, besides=TRUE, main="Insect Sprays", ylim=c(0,20))
errorBars(b, avg, sds, minmax=c(0,20), xpd=TRUE, length=.05)                

# line plot:
emptyPlot(toupper(letters[1:6]), 20, main="Averages", xlab="Spray")

# fake errors:
ci.low <- abs(rnorm(6, mean=2))
ci.high <-  abs(rnorm(6, mean=4))

errorBars(1:6, avg, ci.high, ci.l= ci.low, length=.05, lwd=2)
points(1:6, avg, pch=21, type='o', lty=3, lwd=2,
    bg="white", xpd=TRUE)
# also horizontal bars possible:
errorBars(10, 1, 1.2, horiz=TRUE, col='red')




