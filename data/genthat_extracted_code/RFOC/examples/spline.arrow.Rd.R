library(RFOC)


### Name: spline.arrow
### Title: Spline Arrow
### Aliases: spline.arrow
### Keywords: misc

### ** Examples


plot(c(0,1), c(0,1), type='n')


G=list()
G$x=c(0.1644,0.1227,0.0659,0.0893,0.2346,
0.3514,0.5518,0.7104,0.6887,0.6903,0.8422)
G$y=c(0.8816,0.8305,0.7209,0.6086,0.5372,
0.6061,0.6545,0.6367,0.4352,0.3025,0.0475)



spline.arrow(G$x, G$y)






