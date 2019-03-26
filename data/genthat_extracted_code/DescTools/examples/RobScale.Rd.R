library(DescTools)


### Name: RobScale
### Title: Robust Scaling With Median and Mad
### Aliases: RobScale
### Keywords: univar robust

### ** Examples

x <- d.pizza$temperature
plot(x=seq_along(x), y=RobScale(x), xlim=c(0,100))
points(x=seq_along(x), y=scale(x), col="red" )



