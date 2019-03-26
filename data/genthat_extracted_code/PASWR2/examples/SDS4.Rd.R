library(PASWR2)


### Name: SDS4
### Title: M1 Motorspeedway Times
### Aliases: SDS4
### Keywords: datasets

### ** Examples

ggplot(data = SDS4, aes(x = times)) + geom_histogram(binwidth = 2)
ggplot(data = SDS4, aes(x = times, y = ..density..)) + 
geom_histogram(binwidth = 2, color = "red", fill = "pink", alpha = 0.5) + 
geom_density(fill = "cornsilk", alpha = 0.5) + 
labs(x = "interarrival times to the nearest second", y = "")



