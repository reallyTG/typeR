library(longCatEDA)


### Name: alignTime
### Title: Align time data at a given state or event
### Aliases: alignTime

### ** Examples

# illustrate individually varying times of observation 
set.seed(642531)
y <- matrix(sample(1:5, 500, replace=TRUE), 100, 5)
set.seed(963854)
times <- matrix(runif(600, 1, 3), 100, 6)
# times must be cumulative
times <- t(apply(times, 1, cumsum))
# align at the 2nd instance of state 3
times23 <- alignTime(y, times, which.state=3, nth.state=2)$aligned.times
# plotting
labels <- c('Street', 'Drug Tx', 'Jail', 'Prison', 'Unknown')
lc   <- longCat(y, times=times, Labels=labels)
lc23 <- longCat(y, times=times23, Labels=labels)
par(mfrow=c(3,1), bg='cornsilk3')
longCatPlot(lc, main='Raw Times', legendBuffer=.5, ylab='')
longCatPlot(lc23, main='Aligned: 2nd Intsance of Jail',
            xlab='Days Since 2nd Instance of Jail (via alignTime)', 
            legendBuffer=.5, ylab='')
# repeat calling alignment from longCatPlot, not quite identical due to sorting
# on unaligned data
longCatPlot(lc, main='Aligned: 2nd Instance of Jail (via longCatPlot)', legendBuffer=.5, 
            which.state=3, nth.state=2, ylab='', xlab='Days Since 2nd Instance of Jail')
par(mfrow=c(1,1), bg='transparent')            

# illustrate the adding event indicators
set.seed(45962)
events <- matrix(sample(1:3, 200, replace=TRUE), 100, 2)
set.seed(23498)
event.times <- matrix(sample(c(times), 200, replace=FALSE), 100, 2)
# align at the 1st instance of event 2
alignedTimes <- alignTime(y, times, events=events, event.times=event.times, 
                           which.event=2, nth.event=1)
times12       <- alignedTimes$aligned.times
event.times12 <- alignedTimes$aligned.event.times
# plotting
eventLabels=c('Arrest', 'Drug Test', 'Hearing')
lc <- longCat(y, times=times, Labels=labels,  
              events=events, event.times=event.times, 
              eventLabels=eventLabels)
lc12 <- longCat(y, times=times12, Labels=labels,  
                events=events, event.times=event.times12, 
                eventLabels=eventLabels)
par(mfrow=c(2,1), bg='cornsilk3', mar=c(5.1, 4.1, 4.1, 12.1), xpd=TRUE)
cols <- longCatPlot(lc, legendBuffer=.5,
                    main='Superimpose Events', ylab='')
cols <- longCatPlot(lc12, , legendBuffer=.5,
                    main='Aligned: 1st Drug Test',
                    xlab='Days Since 1st Drug Test', ylab='')
legend(15.5, 50, legend=lc$eventLabels, pch=1:length(lc$eventLabels))
par(mfrow=c(1,1), bg='transparent', mar = c(5, 4, 4, 2) + 0.1, xpd=FALSE)



