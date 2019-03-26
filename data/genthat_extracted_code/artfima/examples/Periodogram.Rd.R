library(artfima)


### Name: Periodogram
### Title: Periodogram
### Aliases: Periodogram
### Keywords: ts

### ** Examples

data(sunspot.year)
Ip <- Periodogram(sunspot.year)
fr <- (1:length(Ip))/length(sunspot.year)
plot(fr, Ip, xlab="frequency", ylab="Periodogram")



