library(polspline)


### Name: dhare
### Title: Hare: hazard regression
### Aliases: dhare hhare phare qhare rhare
### Keywords: distribution smooth survival

### ** Examples

fit <- hare(testhare[,1], testhare[,2], testhare[,3:8])
dhare(0:10, testhare[117,3:8], fit)
hhare(0:10, testhare[1:11,3:8], fit)
phare(10, testhare[1:25,3:8], fit)
qhare((1:19)/20, testhare[117,3:8], fit)
rhare(10, testhare[117,3:8], fit)



