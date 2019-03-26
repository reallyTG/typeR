library(bootstrap)


### Name: mouse.c
### Title: Experiments with mouse
### Aliases: mouse.c
### Keywords: datasets

### ** Examples

str(mouse.c)
if(interactive())par(ask=TRUE)
stripchart(list(treatment=mouse.t, control=mouse.c))
cat("bootstrapping the difference of means, treatment - control:\n")
cat("bootstrapping is done independently for the two groups\n")
mouse.boot.c <- bootstrap(mouse.c, 2000, mean)
mouse.boot.t <- bootstrap(mouse.t, 2000, mean)
mouse.boot.diff <- mouse.boot.t$thetastar - mouse.boot.c$thetastar
hist(mouse.boot.diff)
abline(v=0, col="red2")
sd(mouse.boot.diff)



