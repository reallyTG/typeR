library(areaplot)


### Name: confplot
### Title: Plot Confidence Bands
### Aliases: confplot confplot.default confplot.formula

### ** Examples

model <- lm(log(dist)~log(speed), cars)
ci95 <- predict(model, data.frame(speed=4:25), interval="confidence")
ci50 <- predict(model, data.frame(speed=4:25), interval="confidence", level=0.5)
x <- log(4:25)
y1 <- ci95[,"lwr"]
y2 <- ci95[,"upr"]
mydata <- data.frame(x, y1, y2)

# Input format
confplot(x, y1, y2)               # vectors
confplot(x, cbind(y1,y2))         # y values in 2 columns
confplot(mydata)                  # data in 3 columns
confplot(cbind(y1,y2)~x, mydata)  # formula

# Overlay
plot(log(dist)~log(speed), cars, type="n")
confplot(x, ci95[,2:3], add=TRUE)
confplot(x, ci50[,2:3], add=TRUE, col="darkgray")
lines(x, ci95[,1])
points(log(dist)~log(speed), cars)




