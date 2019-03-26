library(longCatEDA)


### Name: longCatPlot
### Title: Plotting of lc objects
### Aliases: longCatPlot

### ** Examples

# Illustrate longCatPlot with the legend outside the plot
par(mfrow=c(1,1), bg='cornsilk3', mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)
cols <- longCatPlot(
  longCat(example3),
  legendBuffer=0,
  main='Horizontal Line Plot')
legend(7.1, 100, legend=1:5, col=cols, lty=1, lwd=2)
par(bg='transparent', mar = c(5, 4, 4, 2) + 0.1, xpd=FALSE)

### visualizing multivariate data: 3 items at 4 time points
library(MASS)
Sigma <- matrix(.25, 12, 12)
diag(Sigma) <- 1
set.seed(9845)
mu <- rep(c(-.5, 0, .5), 4) + rnorm(12, 0, .25)
set.seed(539)
ymv <- apply(mvrnorm(n=100, mu=mu, Sigma = Sigma), 2, cut, breaks=c(-Inf, 0, Inf), labels=c(0,1))
apply(ymv, 2, table)
(items <- rep(1:3, 4))
(times <- sort(rep(1:4, 3)))
tLabels <- paste('Time', 1:4)
 Labels <- paste('Item', 1:3)
 
# plot time points within items
par(mfrow=c(2,2), bg='cornsilk3', mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)

item1  <- longCat(y=ymv[,items==1], tLabels=tLabels)
cols <- longCatPlot(item1, ylab='', main='Item 1', legendBuffer=0, xlab="", xlas=2)
legend(length(unique(times))+.1, nrow(ymv), legend=0:1, col=cols, lty=1, lwd=2, title='Response')

item2 <- longCat(y=ymv[,items==2], tLabels=tLabels)
longCatPlot(item2, ylab='', main='Item 2', legendBuffer=0, xlab="", xlas=2)
legend(length(unique(times))+.1, nrow(ymv), legend=0:1, col=cols, lty=1, lwd=2, title='Response')

item3 <- longCat(y=ymv[,items==3], tLabels=tLabels)
longCatPlot(item3, ylab='', main='Item 3', legendBuffer=0, xlab="", xlas=2)
legend(length(unique(times))+.1, nrow(ymv), legend=0:1, col=cols, lty=1, lwd=2, title='Response')

par(bg='transparent', mar = c(5, 4, 4, 2) + 0.1, xpd=FALSE)

# plot items within time points
par(mfrow=c(2,2), bg='cornsilk3', mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)

time1  <- longCat(y=ymv[,times==1], tLabels=Labels)
cols <- longCatPlot(time1, ylab='', main='Time 1', legendBuffer=0, xlab="")
legend(length(unique(times))+.1, nrow(ymv), legend=0:1, col=cols, lty=1, lwd=2, title='Response')

time2  <- longCat(y=ymv[,times==2], tLabels=Labels)
cols <- longCatPlot(time2, ylab='', main='Time 2', legendBuffer=0, xlab="")
legend(length(unique(times))+.1, nrow(ymv), legend=0:1, col=cols, lty=1, lwd=2, title='Response')

time3  <- longCat(y=ymv[,times==3], tLabels=Labels)
cols <- longCatPlot(time3, ylab='', main='Time 3', legendBuffer=0, xlab="")
legend(length(unique(times))+.1, nrow(ymv), legend=0:1, col=cols, lty=1, lwd=2, title='Response')

time4  <- longCat(y=ymv[,times==4], tLabels=Labels)
cols <- longCatPlot(time4, ylab='', main='Time 4', legendBuffer=0, xlab="")
legend(length(unique(times))+.1, nrow(ymv), legend=0:1, col=cols, lty=1, lwd=2, title='Response')

par(mfrow=c(1,1), bg='transparent', mar = c(5, 4, 4, 2) + 0.1, xpd=FALSE)

## Not run: 
##D # for data sets with many rows, writing directly to a file 
##D # is much faster and unaffected by device resizing, see ?pdf
##D pdf('C:/mydir/mysubdir/myfile.pdf')
##D par(bg='cornsilk3')
##D longCatPlot(f3lc, main='Sorted', colScheme='heat', lwd=2)
##D par(mfrow=c(1,1), bg='transparent')
##D dev.off()
##D # see ?jpeg for picture file options
## End(Not run)



