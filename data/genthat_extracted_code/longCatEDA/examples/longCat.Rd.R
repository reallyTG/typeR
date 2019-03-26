library(longCatEDA)


### Name: longCat
### Title: Creation of Objects of Class longCat
### Aliases: longCat

### ** Examples

# create the longcat object similar to Figure 2 in Tueller (2016)
times <- c(1,100,200,300,400,500,600)
f2lc <- longCat(example2cat, times)

# object summary
summary(f2lc)

# compare growth curves to longCat
par(mfrow=c(1,2), bg='cornsilk3')
longContPlot(example2cat, times, ylim=c(1,5), 
  main='Growth Curves', ylab='', xlab='Days')
longCatPlot(f2lc, lwd=4, main='Horizontal Line Plot', colScheme='heat', legendBuffer=.2)
par(mfrow=c(1,1), bg='transparent')

# illustrate individually varying times of observation 
set.seed(642531)
y <- matrix(sample(1:5, 500, replace=TRUE), 100, 5)
set.seed(963854)
times <- matrix(runif(600, 1, 3), 100, 6)
# times must be cumulative
times <- t(apply(times, 1, cumsum))
lc <- longCat(y, times=times)
par(mfrow=c(1,1), bg='cornsilk3', mar=c(5.1, 4.1, 4.1, 10.1), xpd=TRUE)
cols <- longCatPlot(lc, legendBuffer=0, groupBuffer=0, 
	main='Individually Varying Times of Observation')
legend(15.5, 100, legend=lc$Labels, lty=1, col=cols, lwd=2)
par(bg='transparent', mar = c(5, 4, 4, 2) + 0.1, xpd=FALSE)

# illustrate the adding event indicators
set.seed(45962)
events <- matrix(sample(1:3, 200, replace=TRUE), 100, 2)
set.seed(23498)
event.times <- matrix(sample(c(times), 200, replace=FALSE), 100, 2)
labels <- c('Street', 'Drug Tx', 'Jail', 'Prison', 'Unknown')
eventLabels=c('Arrest', 'Drug Test', 'Hearing')
lc <- longCat(y, times=times, Labels=labels,  
              events=events, event.times=event.times, 
              eventLabels=eventLabels)
par(mfrow=c(1,1), bg='cornsilk3', mar=c(5.1, 4.1, 4.1, 12.1), xpd=TRUE)
cols <- longCatPlot(lc, legendBuffer=0, groupBuffer=0, 
                    main='Superimpose Events Over States')
legend(15.5, 100, legend=lc$Labels, lty=1, col=cols, lwd=2)
legend(15.5, 40, legend=lc$eventLabels, pch=1:length(lc$eventLabels))
par(bg='transparent', mar = c(5, 4, 4, 2) + 0.1, xpd=FALSE)

## Not run: 
##D # illustrate handling non time-ordered input (e.g., factor analysis data)
##D y <- matrix(sample(c('1', '2', '3', '4', '5'), 500, replace=TRUE), 100, 5)
##D lc <- longCat(y)
##D par(mfrow=c(1,1), bg='cornsilk3', mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)
##D cols <- longCatPlot(lc, legendBuffer=0)
##D legend(6, 100, legend=lc$factors, lty=1, col=cols, lwd=2)
##D par(bg='transparent', mar = c(5, 4, 4, 2) + 0.1, xpd=FALSE)
##D 
##D # illustrate plotting with more than 9 categories 
##D # (a warning is issued) 
##D y <- matrix(sample(1:18, 500, replace=TRUE), 100, 5)
##D lc <- longCat(y)
##D par(mfrow=c(1,1), bg='cornsilk3', mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)
##D cols <- longCatPlot(lc, legendBuffer=0)
##D legend(6, 100, legend=lc$factors, lty=1, col=cols, lwd=2)
##D par(bg='transparent', mar = c(5, 4, 4, 2) + 0.1, xpd=FALSE)
## End(Not run)




