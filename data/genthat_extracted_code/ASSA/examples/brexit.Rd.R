library(ASSA)


### Name: brexit
### Title: Brexit Poll Tracker
### Aliases: brexit
### Keywords: datasets

### ** Examples

## Leave--stay plot (de Carvalho and Martos, 2018; Fig. 1)
data(brexit)
attach(brexit)
par(pty = "s")
plot(leave[(leave > stay)], stay[(leave > stay)],
     xlim = c(22, 66), ylim = c(22, 66), pch = 16, col = "red",
     xlab = "Leave", ylab = "Stay")
points(leave[(stay > leave)], stay[(stay > leave)],
       pch = 16, col = "blue")
points(leave[(stay == leave)], stay[(stay == leave)],
       pch = 24)
abline(a = 0, b = 1, lwd = 3)



