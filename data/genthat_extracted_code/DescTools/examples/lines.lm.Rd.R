library(DescTools)


### Name: lines.lm
### Title: Add a Linear Regression Line
### Aliases: lines.lm
### Keywords: aplot math

### ** Examples

par(mfrow=c(1,2))

plot(hp ~ wt, mtcars)
lines(lm(hp ~ wt, mtcars), col="steelblue")

# add the prediction intervals in different color
plot(hp ~ wt, mtcars)
r.lm <- lm(hp ~ wt, mtcars)
lines(r.lm, col="red", pred.level=0.95, args.pband=list(col=SetAlpha("grey",0.3)) )

# works with transformations too
plot(dist ~ speed, cars)
lines(lm(dist ~ poly(speed, degree=2), cars), col=hred)



