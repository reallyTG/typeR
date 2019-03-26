library(rmeta)


### Name: catheter
### Title: Meta-analysis of antibacterial catheter coating
### Aliases: catheter
### Keywords: datasets

### ** Examples

library(rmeta)
data(catheter)
a <- meta.MH(n.trt, n.ctrl, col.trt, col.ctrl, data=catheter,
             names=Name, subset=c(13,6,5,3,7,12,4,11,1,8,10,2))
b <- meta.DSL(n.trt, n.ctrl, col.trt, col.ctrl, data=catheter,
              names=Name,subset=c(13,6,5,3,7,12,4,11,1,8,10,2))
a
b
summary(a)
summary(b)
plot(a)
plot(b)



