library(gplots)


### Name: angleAxis
### Title: Add a Axis to a Plot with Rotated Labels
### Aliases: angleAxis
### Keywords: aplot

### ** Examples

## Don't show: 
set.seed(42)
## End(Don't show)
# create a vector with some values and long labels
values <- sample(1:10)
names(values) <- sapply(letters[1:10], 
                        function(x) paste(rep(x, 10), sep="",collapse="") 
                        ) 

# barplot labels are too long for the available space, hence some are not plotted
barplot(values)

# to add angled labels, tell barplot not to label the x axis, and store the bar location
at <- barplot(values, xaxt="n")
# then use angleAxs
angleAxis(1, at=at, labels = names(values))

# angle counter-clockwise instead
at <- barplot(values, xaxt="n")
angleAxis(1, at=at, labels = names(values), srt=-45, adj=0)

# put labels at the top
oldpar <- par()$mar
par(mar=c(1,4,5,2)+0.1)
at <- barplot(values, xaxt="n")
angleAxis(3, at=at, labels = names(values))
par(oldpar)

# put labels on the left
oldpar <- par()$mar
par(mar=c(5,5,3,2)+0.1)
at <- barplot(values, yaxt="n", horiz=TRUE)
angleAxis(2, at=at, labels = names(values))
par(oldpar)

# put labels on the right
oldpar <- par()$mar
par(mar=c(2,5,3,5)+0.1)
at <- barplot(values, yaxt="n", horiz=TRUE)
angleAxis(4, at=at, labels = names(values))
par(oldpar)

# specify colors for bars and labels
at <- barplot(values, xaxt="n", col=1:10)
angleAxis(1, at=at, labels = names(values), col=1:10)



