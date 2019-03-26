library(lcc)


### Name: summary.lcc
### Title: Summarize an lcc object
### Aliases: summary.lcc

### ** Examples


data(hue)
## Second degree polynomial model with random intercept, slope and
## quadratic term
fm1<-lcc(dataset = hue, subject = "Fruit", resp = "H_mean",
         method = "Method", time = "Time", qf = 2, qr = 2)
summary(fm1, type="model")
summary(fm1, type="lcc")



