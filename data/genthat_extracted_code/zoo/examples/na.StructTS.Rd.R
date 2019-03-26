library(zoo)


### Name: na.StructTS
### Title: Fill NA or specified positions.
### Aliases: na.StructTS na.StructTS.zoo na.StructTS.ts
### Keywords: ts

### ** Examples


z <- zooreg(rep(10 * seq(8), each = 4) + rep(c(3, 1, 2, 4), times = 8), 
	start = as.yearqtr(2000), freq = 4)
z[25] <- NA

zout <- na.StructTS(z)

plot(cbind(z, zout), screen = 1, col = 1:2, type = c("l", "p"), pch = 20)





