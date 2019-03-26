library(DescTools)


### Name: LinScale
### Title: Linear Scaling
### Aliases: LinScale
### Keywords: univar

### ** Examples

# transform the temperature from Celsius to Fahrenheit
LinScale(d.pizza[1:20, "temperature"], 0, 100, -17.8, 37.8 )

# and the price from Dollar to Euro
LinScale(d.pizza[1:20, "price"], 0, 1, 0, 0.76)

# together
LinScale(d.pizza[1:20, c("temperature", "price")],
  0, c(100, 1), c(-17.8, 0), c(37.8, 0.76) )


## Not run: 
##D par(mfrow=c(3,1), mar=c(0,5,0,3), oma=c(5,0,5,0))
##D plot(LinScale(d.frm[,1]), ylim=c(-2,2), xaxt="n", ylab="LinScale")
##D plot(RobScale(d.frm[,1]), ylim=c(-2,2), xaxt="n", ylab="RobScale")
##D plot(scale(d.frm[,1]), ylim=c(-2,2), ylab="scale")
##D title("Compare scales", outer = TRUE)
## End(Not run)



