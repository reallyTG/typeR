library(pastecs)


### Name: regul.screen
### Title: Test various regulation parameters
### Aliases: regul.screen
### Keywords: ts chron

### ** Examples

data(releve)
# This series is very irregular, and it is difficult
# to choose the best regular time-scale
releve$Day
length(releve$Day)
intervals <- releve$Day[2:61]-releve$Day[1:60]
intervals
range(intervals)
mean(intervals)
# A combination of xmin=1, deltat=22 and n=61 seems correct
# But is it the best one?
regul.screen(releve$Day, xmin=0:11, deltat=16:27, tol=1.05)
# Now we can tell that xmin=9, deltat=21, n=63, with tol=1.05
# is a much better choice! 



