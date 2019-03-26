library(ordDisp)


### Name: plotordDisp
### Title: Visualization of Estimated Effects
### Aliases: plotordDisp

### ** Examples

data(reti)

mod <- ordDisp(RET~SM+DIAB+GH+BP|SM+DIAB,data=reti,family="cumulative")
plot(mod,names=c("SM","DIAB"),colorvec=c(1,2))
plotvglm(mod)




