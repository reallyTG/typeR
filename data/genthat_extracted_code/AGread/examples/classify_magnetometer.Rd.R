library(AGread)


### Name: classify_magnetometer
### Title: Convert magnetometer signal to cardinal direction
### Aliases: classify_magnetometer

### ** Examples

data(imu_to_collapse)

X <- mean(imu_to_collapse$Magnetometer.X)
Y <- mean(imu_to_collapse$Magnetometer.Y)
Z <- mean(imu_to_collapse$Magnetometer.Z)

classify_magnetometer(X, Y, Z)




