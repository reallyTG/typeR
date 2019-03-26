library(longCatEDA)


### Name: sorter
### Title: General Sorting Function
### Aliases: sorter

### ** Examples

### create a plot like that in Figure 3 from Tueller, Van Dorn, & Bobashev (2016)
par(mfrow=c(1,2), bg='cornsilk3')
times <- c(1,100,200,300,400,500,600)
f3lc <- longCat(example3, times); f3lc$sorted <- TRUE; f3lc$y.sorted <- f3lc$y
longCatPlot(f3lc, main='Unsorted', colScheme='heat', lwd=2, legendBuffer=.2)
f3lc <- longCat(example3, times)
longCatPlot(f3lc, main='Sorted', colScheme='heat', lwd=2, legendBuffer=.2)

### sort with a grouping variable and plot
par(mfrow=c(1,1), bg='cornsilk3', mar=c(5.1, 4.1, 4.1, 9.1), xpd=TRUE)
times <- c(1,100,200,300,400,500,600)
lc <- longCat(example3, times)
group <- sample(1:3, nrow(example3), replace=TRUE)
grouplc <- sorter(lc, group=group, groupLabels=1:3)
cols <- longCatPlot(grouplc, groupBuffer=.15, main='Grouped Data', colScheme='heat', 
                    lwd=2, legendBuffer=0)
legend(610, 130, legend=1:5, col=cols, lty=1, lwd=2)
par(bg='transparent', mar = c(5, 4, 4, 2) + 0.1, xpd=FALSE)

### using the sorted data from the previous plot, repeate using ggplot2 
#   following the example of Figure 4 of bdemarest's answer on 
#   https://stackoverflow.com/questions/11513149/
#   good-ways-to-visualize-longitudinal-categorical-data-in-r/
grouplc.df <- data.frame(id=1:nrow(grouplc$group.sorted), 
                group=grouplc$group.sorted[,1], grouplc$y.sorted)
grouplc.long <- reshape(grouplc.df,
                        varying = names(grouplc$y.sorted),
                        v.names = "score",
                        timevar = "time",
                        times = times[1:ncol(grouplc$y.sorted)],
                        direction = "long")
grouplc.long$score <- factor(grouplc.long$score)
grouplc.long$group <- factor(grouplc.long$group, level=3:1)
# remove NA's introduced using group option in sorter
grouplc.long <- na.omit(grouplc.long) 
library(ggplot2)
ggplot(grouplc.long, aes(x=time, y=id, fill=score)) + 
  geom_tile(colour="transparent") +
  scale_fill_manual(values=cols) +
  facet_grid(group ~ ., space="free_y", scales="free_y")

### sort with a grouping variable and events and plot
times <- c(1,100,200,300,400,500,600)
set.seed(45962)
events <- matrix(sample(1:3, nrow(example3)*2, replace=TRUE), nrow(example3), 2)
set.seed(23498)
event.times <- matrix(sample(min(times):max(times), nrow(example3)*2, replace=TRUE), 
nrow(example3), 2)
labels <- c('Street', 'Drug Tx', 'Jail', 'Prison', 'Unknown')
eventLabels=c('Arrest', 'Drug Test', 'Hearing')
eventlc <- longCat(example3, times=times, Labels=labels,  
              events=events, event.times=event.times, 
              eventLabels=eventLabels)
set.seed(4290)              
groupevent <- sample(1:3, nrow(example3), replace=TRUE)
groupeventlc <- sorter(eventlc, group=groupevent)            
par(mfrow=c(1,1), bg='cornsilk3', mar=c(5.1, 4.1, 4.1, 12.1), xpd=TRUE)
cols <- longCatPlot(groupeventlc, legendBuffer=0, groupBuffer=0.15, 
                    main='Grouping and Events')
legend(610, 130, legend=groupeventlc$Labels, lty=1, col=cols, lwd=2)
legend(610, 60, legend=groupeventlc$eventLabels, 
       pch=1:length(groupeventlc$eventLabels))
par(bg='transparent', mar = c(5, 4, 4, 2) + 0.1, xpd=FALSE)




