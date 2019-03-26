library(gplots)


### Name: lmplot2
### Title: Plots to assess the goodness of fit for the linear model objects
### Aliases: lmplot2
### Keywords: hplot

### ** Examples

ctl <- rnorm(100, 4)
trt <- rnorm(100, 4.5)
group <- gl(2,100,200, labels=c("Ctl","Trt"))
weight <- c(ctl, trt)
wt.err <- rnorm(length(weight), mean=weight, sd=1/2)
x <- lm(weight ~ group + wt.err)

lmplot2(x)

lmplot2(x, which=1,   width=1/3)
lmplot2(x, which=1:3, width=1/3)



