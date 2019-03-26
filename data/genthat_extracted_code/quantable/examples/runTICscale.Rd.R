library(quantable)


### Name: runTICscale
### Title: running total ion count scaling (TIC)
### Aliases: runTICscale

### ** Examples

res = c(rnorm(1000,3,2),rnorm(2000,8,1))
res2 = runTICscale(res)
plot(res,type="p",pch=".",col=1,cex=0.5)
lines(1:length(res),res2$mean,col=3)
points(res2$scaled, pch=".",cex=3,col=2)




