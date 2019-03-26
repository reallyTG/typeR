library(plotfunctions)


### Name: add_bars
### Title: Adding bars to an existing plot.
### Aliases: add_bars

### ** Examples

# hypothetical experiment:
adults   =  stats::rpois(100, lambda = 5)
children =  stats::rpois(100, lambda = 4)
newd <- data.frame(Adults = table( factor(adults, levels=0:15) ),
    Children = table( factor(children, levels=0:15) ) )
newd <- newd[,c(1,2,4)]
names(newd)[1] <- "value"

# barplot of Adults:
b <- barplot(newd$Adults.Freq, beside=TRUE, names.arg=newd$value, border=NA, ylim=c(0,30))
# overlay Children measures:
add_bars(b, newd$Children.Freq, col='red', density=25, xpd=TRUE)

# variants:
b <- barplot(newd$Adults.Freq, beside=TRUE, names.arg=newd$value, border=NA, ylim=c(0,30))
add_bars(b+.1, newd$Children.Freq, width=.85, col=alpha('red'), border=NA, xpd=TRUE)

emptyPlot(c(-30,30), c(0,15), v0=0, ylab="Condition")
add_bars(-1*newd$Children.Freq, 0:15, y0=0, col=alpha("blue"), 
    border="blue", horiz=TRUE)
add_bars(newd$Adults.Freq, 0:15, y0=0, col=alpha("red"), 
    border="red", horiz=TRUE)
mtext(c("Children", "Adults"), side=3, at=c(-15,15), line=1, cex=1.25, font=2)

# adding shadow:
b <- barplot(newd$Adults.Freq, beside=TRUE, names.arg=newd$value, with=.9, col='black', border=NA)
add_bars(b+.2, newd$Adults.Freq+.2, y0=.2, width=.9, col=alpha('black', f=.2), border=NA, xpd=TRUE)




