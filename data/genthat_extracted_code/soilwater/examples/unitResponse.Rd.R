library(soilwater)


### Name: unitResponse
### Title: The water table recharge: the response unit
### Aliases: unitResponse

### ** Examples


library(soilwater)


t <- seq(0,2,by=0.001)
d <- c(1,0.75,0.5,0.25)
val1 <- unitResponse(t, d = d[1], D = 1, H = 1, m = 500)

val2 <- unitResponse(t, d = d[2], D = 1, H = 1, m = 500)

val3 <- unitResponse(t, d = d[3], D = 1, H = 1, m = 500)

val4 <- unitResponse(t, d = d[4], D = 1, H = 1, m = 500)






