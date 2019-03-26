library(oce)


### Name: T90fromT68
### Title: Convert from IPTS-68 to ITS-90 temperature
### Aliases: T90fromT68

### ** Examples


library(oce)
T68 <- seq(3, 20, 1)
T90 <- T90fromT68(T68)
sqrt(mean((T68-T90)^2))




