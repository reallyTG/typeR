library(texreg)


### Name: plotreg
### Title: Create coefficient plots from statistical model output
### Aliases: plotreg coefplot
### Keywords: print misc utilities IO programming|interface

### ** Examples

#example from the 'lm' help file:
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2,10,20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group)
screenreg(lm.D9)  # print model output to the R console
plotreg(lm.D9)    # plot model output as a diagram



