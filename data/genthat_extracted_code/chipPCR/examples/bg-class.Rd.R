library(chipPCR)


### Name: bg
### Title: Class '"bg"'
### Aliases: bg-class bg show.bg show,bg-method
### Keywords: classes

### ** Examples

res <- AmpSim(cyc = 1:40, Cq = 25)
tmp <- bg.max(res)
summary(tmp)
plot(tmp)



