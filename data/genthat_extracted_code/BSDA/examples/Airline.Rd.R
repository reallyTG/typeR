library(BSDA)


### Name: Airline
### Title: Percentage of on-time arrivals and number of complaints for 11
###   airlines
### Aliases: Airline
### Keywords: datasets

### ** Examples


with(data = Airline, 
     barplot(complaints, names.arg = airline, col = "lightblue", 
     las = 2)
)
plot(complaints ~ ontime, data = Airline, pch = 19, col = "red",
     xlab = "On time", ylab = "Complaints")




