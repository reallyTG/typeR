library(allanvar)


### Name: allanvar
### Title: Allan Variance Package
### Aliases: allanvar allanvar
### Keywords: package

### ** Examples

#This example is also available under
#the command: demo(allanvar)

#Loading values
data(gyroz)

#Allan variance computation using avar
avgyroz <- avar(gyroz@.Data, frequency(gyroz))

#Allan variance computation using avarn
avngyroz <- avarn(gyroz@.Data, frequency(gyroz))

#Allan variance computation using avari
#Simple integration of the angular velocity
igyroz <- cumsum(gyroz@.Data * (1/frequency(gyroz)))
igyroz <- ts (igyroz, start=c(igyroz[1]), delta=(1/frequency(gyroz)))
avigyroz <- avari(igyroz@.Data, frequency(igyroz))

#Ploting all
plot (avgyroz$time,sqrt(avgyroz$av),log= "xy", xaxt="n" , yaxt="n", type="l",
        col="blue", xlab="", ylab="")
lines (avngyroz$time,sqrt(avngyroz$av), col="green", lwd=1)
lines (avigyroz$time,sqrt(avigyroz$av), col="red")
axis(1, c(0.001, 0.01, 0.1, 0, 1, 10, 100, 1000, 10000, 100000))
axis(2, c(0.00001, 0.0001, 0.001, 0.01, 0.1, 0, 1, 10, 100, 1000, 10000))
grid(equilogs=TRUE, lwd=1, col="orange")
title(main = "Allan variance Analysis Comparison", xlab = "Cluster Times
        (Sec)", ylab = "Allan Standard Deviation (rad/s)")

legend(10, 4e-03, c("GyroZ (avar)", "GyroZ(avarn)", "GyroZ(avari)"),  fill =
        c("blue", "green", "red"))




