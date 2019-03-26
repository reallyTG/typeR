library(rmeta)


### Name: cochrane
### Title: Data for Cochrane Collaboration logo
### Aliases: cochrane
### Keywords: datasets

### ** Examples

data(cochrane)
steroid <- meta.MH(n.trt, n.ctrl, ev.trt, ev.ctrl,
                   names=name, data=cochrane)
plot(steroid, col=meta.colors("RoyalBlue"))



