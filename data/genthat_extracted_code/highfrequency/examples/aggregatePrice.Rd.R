library(highfrequency)


### Name: aggregatePrice
### Title: Aggregate a time series but keep first and last observation
### Aliases: aggregatePrice
### Keywords: data manipulation

### ** Examples

#load data
data("sample_tdata");
#aggregate price data to the 30 second frequency
head(sample_tdata$PRICE)
head(aggregatePrice(sample_tdata$PRICE,on="secs",k=30));



