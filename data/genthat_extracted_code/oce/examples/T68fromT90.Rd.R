library(oce)


### Name: T68fromT90
### Title: Convert from ITS-90 to IPTS-68 temperature
### Aliases: T68fromT90

### ** Examples


library(oce)
T68 <- seq(3, 20, 1)
T90 <- T90fromT68(T68)
sqrt(mean((T68-T90)^2))




