library(lcc)


### Name: lccPlot
### Title: Plot an lcc object
### Aliases: lccPlot

### ** Examples


data(hue)
## Second degree polynomial model with random intercept, slope and
## quadratic term
fm1<-lcc(dataset = hue, subject = "Fruit", resp = "H_mean",
         method = "Method", time = "Time", qf = 2, qr = 2,
         components=TRUE)
lccPlot(fm1)
         



