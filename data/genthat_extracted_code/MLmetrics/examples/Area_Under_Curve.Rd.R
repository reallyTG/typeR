library(MLmetrics)


### Name: Area_Under_Curve
### Title: Calculate the Area Under the Curve
### Aliases: Area_Under_Curve

### ** Examples

x <- seq(0, pi, length.out = 200)
plot(x = x, y = sin(x), type = "l")
Area_Under_Curve(x = x, y = sin(x), method = "trapezoid", na.rm = TRUE)



