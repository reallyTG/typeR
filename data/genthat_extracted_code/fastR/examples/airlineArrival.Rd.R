library(fastR)


### Name: airlineArrival
### Title: Airline On-Time Arrival Data
### Aliases: airlineArrival
### Keywords: datasets

### ** Examples


row.perc(xtabs(~Airline+Result, data=airlineArrival))
for (city in levels(airlineArrival$Airport)) {
	cat(paste('\nArriving in ', city,':\n',sep=''))
	print(row.perc(xtabs(~Airline+Result, airlineArrival, 
		subset=Airport==city)))
}




