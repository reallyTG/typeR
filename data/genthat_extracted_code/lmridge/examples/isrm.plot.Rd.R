library(lmridge)


### Name: isrm.plot
### Title: ISRM and m-scale Plot
### Aliases: isrm.plot
### Keywords: ISRM m-scale

### ** Examples

mod <- lmridge(y~., as.data.frame(Hald), K = seq(0, 0.2, 0.002))

isrm.plot(mod)
isrm.plot(mod, abline=FALSE)



