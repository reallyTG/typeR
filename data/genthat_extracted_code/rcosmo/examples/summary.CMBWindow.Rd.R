library(rcosmo)


### Name: summary.CMBWindow
### Title: Summarise a 'CMBWindow'
### Aliases: summary.CMBWindow

### ** Examples


win <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2))
summary(win)

win1<- CMBWindow(x=0,y=3/5,z=4/5,r=0.8, set.minus = TRUE)
summary(win1)





