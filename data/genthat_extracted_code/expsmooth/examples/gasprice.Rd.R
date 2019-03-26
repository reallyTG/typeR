library(expsmooth)


### Name: gasprice
### Title: US gasoline prices
### Aliases: gasprice
### Keywords: datasets

### ** Examples

par(mar=c(5,4,2,5))
plot(gasprice[,1], xlab="Year", ylab="Average retail price per gallon (dollars)", 
  main="Gasoline and oil prices")
par(new=TRUE)
plot(gasprice[,2], col="blue", xaxt="n", yaxt="n", xlab="", ylab="")
axis(4)
mtext("Spot price per barrel (dollars)", side=4, line=3)
legend("topleft", col=c("black","blue"), lty=1,
  legend=c("Ave retail price of gasoline", "Spot price of WTI oil"))



